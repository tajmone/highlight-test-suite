:: "validate.bat" v1.0.0 | 2019/01/08 | by Tristano Ajmone
:: -----------------------------------------------------------------------------
:: This script will validate all the PureBasic sources in this folder against a
:: specific PureBasic version (set via %_PB_VER_REQUIRED_%) and using both the
:: x86 and x86_64 versions of the PBCompiler (if available). The script will
:: look for PureBasic in the default ProgramFiles setup folders, assuming that
:: the the lastest version of the language was installed using default setup
:: directories.
:: -----------------------------------------------------------------------------
@ECHO OFF & CLS
:: =================
:: Enivronment Setup
:: =================
SETLOCAL EnableDelayedExpansion
CALL :InitANSIColors   &:: Defines some ANSI colors variables
ECHO %WHITE%
ECHO ********************************************************************************
ECHO *                                                                              *
ECHO *                      Validate PureBasic Source Files                         *
ECHO *                                                                              *
ECHO ********************************************************************************
SET _EXITCODE_=0
:: =============================================================================
::                              PB Compiler Setup                               
:: =============================================================================
:: PB compiler must match this specific PureBasic version:
SET _PB_VER_REQUIRED_=5.62
SET _PBCompiler32_=
SET _PBCompiler64_=
:: -----------------------------------------------------------------------------
ECHO The current source files must be tested using a %BLUE%PureBasic %_PB_VER_REQUIRED_%%RESET_COLORS% compiler.
:: -----------------------------------------------------------------------------
::                              Detect OS Bitness                               
:: -----------------------------------------------------------------------------
ECHO Verifying OS bitness and checking for available compilers:
ECHO.
SET _OS_BITNESS_=64
IF %PROCESSOR_ARCHITECTURE% == x86 (
  	IF NOT DEFINED PROCESSOR_ARCHITEW6432 (
  		Set _OS_BITNESS_=32
	)
)
ECHO - OS: %_OS_BITNESS_% bit.
:: -----------------------------------------------------------------------------
::                      Check If PB Compilers Are Present                       
:: -----------------------------------------------------------------------------
:: Depending on the OS bitness, we'll expect different PB Compilers paths:
IF %_OS_BITNESS_% == 64 (
	SET _PBCompiler32_="%ProgramFiles(x86)%\PureBasic\Compilers\pbcompiler.exe"
	SET _PBCompiler64_="%ProgramFiles%\PureBasic\Compilers\pbcompiler.exe"
) ELSE (
	SET _PBCompiler32_="%ProgramFiles%\PureBasic\Compilers\pbcompiler.exe"
	SET _PBCompiler64_=
)

:: Now we must check wether the x86 and x86_64 PB Compilers are actually present:
IF NOT EXIST %_PBCompiler32_% SET _PBCompiler32_=
IF NOT EXIST %_PBCompiler64_% SET _PBCompiler64_=
:: -----------------------------------------------------------------------------
::                          Check PB Compilers Version                          
:: -----------------------------------------------------------------------------
:: Let's check that the available PB Compilers match the required version:

:: Check 32-bit:
IF DEFINED _PBCompiler32_ (
	CALL :GetPBCompilerVersion !_PBCompiler32_!
	IF !_PB_VER_REQUIRED_! ==  !_PB_VER_FOUND_! (
		ECHO - %GREEN%PB Compiler 32-bit%RESET_COLORS%: !_PB_VER_FOUND_! (OK!^)
	) ELSE (
		SET _PBCompiler32_=
		ECHO - %RED%PB Compiler 32-bit%RESET_COLORS%: !_PB_VER_FOUND_! (WRONG VERSION!^)
	)
) ELSE (
	ECHO - %RED%PB Compiler 32-bit%RESET_COLORS%: NOT FOUND!
)

:: Check 64-bit:
IF DEFINED _PBCompiler64_ (
	CALL :GetPBCompilerVersion !_PBCompiler64_!
	IF !_PB_VER_REQUIRED_! ==  !_PB_VER_FOUND_! (
		ECHO - %GREEN%PB Compiler 64-bit%RESET_COLORS%: !_PB_VER_FOUND_! (OK!^)
	) ELSE (
		SET _PBCompiler64_=
		ECHO - %RED%PB Compiler 64-bit%RESET_COLORS%: !_PB_VER_FOUND_! (WRONG VERSION!^)
	)
) ELSE (
	ECHO - PB Compiler 64-bit: NOT FOUND!
)
ECHO.
:: -----------------------------------------------------------------------------
::                       Do We Have a Right PB Compiler?                        
:: -----------------------------------------------------------------------------
:: If we don't have at least one usable compiler we must abort:
SET _ERR=1
IF DEFINED _PBCompiler32_ SET _ERR=
IF DEFINED _PBCompiler64_ SET _ERR=
IF DEFINED _ERR (
	ECHO %RED%** ERROR! ** No PureBasic compiler of the required version was found.
	ECHO %RESET_COLORS%Aborting script...
	SET _EXITCODE_=1
	GOTO :EXIT_SCRIPT
)
:: ==============================================================================
::                                Validate Sources                               
:: ==============================================================================
FOR %%i IN (*.pb) DO (
    ECHO %BLUE%================================================================================
    ECHO Checking "%YELLOW%%%i%BLUE%"
    ECHO ================================================================================%RESET_COLORS%
	IF DEFINED _PBCompiler32_ (
		CALL %_PBCompiler32_% /CHECK %%i  > nul 2>&1 ^
		&& ECHO - %GREEN%32bit Compilation Check: PASSED!%RESET_COLORS% ^
		|| ECHO - %RED%32bit Compilation Check: FAILED!%RESET_COLORS% ^
	)
	IF DEFINED _PBCompiler64_ (
		CALL %_PBCompiler64_% /CHECK %%i  > nul 2>&1 ^
		&& ECHO - %GREEN%64bit Compilation Check: PASSED!%RESET_COLORS% ^
		|| ECHO - %RED%64bit Compilation Check: FAILED!%RESET_COLORS% ^
	)
)

:: =============================
:: Wrap-Up and Exit Batch Script
:: =============================
:EXIT_SCRIPT

ECHO %RESET_COLORS%      &:: Reset ANSI terminal colors

:: Destroy env vars (required due to CMD /K further on):
CALL :DestroyANSIColors  &:: Undefines the ANSI colors variables
SET _ERR=
SET _OS_BITNESS_=
SET _PB_VER_FOUND_=
SET _PB_VER_REQUIRED_=
SET _PBCompiler32_=
SET _PBCompiler64_=

ECHO // END //

:: Ensure that CMD remains open if the script was launched via File Explorer:
ECHO "%cmdcmdline%" | FINDSTR /IC:"%windir%" >nul && (
    CMD /K
)

EXIT /B %_EXITCODE_%

:: *****************************************************************************
:: *                                                                           *
:: *                                FUNCTIONS                                  *
:: *                                                                           *
:: *****************************************************************************
:: =============================================================================
:: func                   Get PureBasic Compiler Version                        
:: =============================================================================
:GetPBCompilerVersion

FOR /F "tokens=2" %%i IN ('%1 /VERSION') DO SET _PB_VER_FOUND_=%%~i
EXIT /B
:: =============================================================================
:: func             Initialize ANSI Terminal Colors Variables                   
:: =============================================================================
:InitANSIColors

SET RESET_COLORS=[0m
:: ========================
:: Foreground Colors
:: ========================
SET BLUE=[36m
SET GRAY=[37m
SET GREEN=[92m
SET RED=[91m
SET WHITE=[97m
SET YELLOW=[93m
:: ========================
:: Colored Backgrounds
:: ========================
SET BG_GREEN=[97;102m
SET BG_RED=[97;101m
EXIT /B
:: =============================================================================
:: func                   Destroy ANSI Colors Variables                         
:: =============================================================================
:: Clean up env-vars before leaving script. This precaution is required because
:: of the code that ensures that CMD remains open if the script was launched via
:: File Explorer -- in that case, variables set by this script will persist.
:DestroyANSIColors

SET RESET_COLORS=
SET BLUE=
SET GRAY=
SET GREEN=
SET RED=
SET WHITE=
SET YELLOW=
SET BG_GREEN=
SET BG_RED=
EXIT /B
