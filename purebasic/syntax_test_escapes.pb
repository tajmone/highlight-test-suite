; ******************************************************************************
; *                                                                            *
; *                           Escape Sequences Test                            *
; *                                                                            *
; ******************************************************************************
; PureBASIC 5.62 | 
; ------------------------------------------------------------------------------

; PureBasic supports the following escape sequences:
; 
;   \a  : alarm           Chr(7)
;   \b  : backspace       Chr(8)
;   \f  : formfeed        Chr(12)
;   \n  : newline         Chr(10)
;   \r  : carriage return Chr(13)
;   \t  : horizontal tab  Chr(9)
;   \v  : vertical tab    Chr(11)
;   \"  : double quote    Chr(34)
;   \\  : backslash       Chr(92)
; 
; Taken from:
;     https://www.purebasic.com/documentation/reference/general_rules.html

; Regarding PureBasic support of escape sequences:
; 
; * They can only be used inside Escaped Strings (~"").
; * They can't be used in char literals (e.g. '\t' to represent Ascii char 9).
; * Ascii and Unicode escapes are not supported (eg "\xFF", "\u0009", etc.).

; ==============================================================================
;-                               Escaped Strings                                
; ==============================================================================
; By prefixing a tilda to a literal string escape sequences are supported:

string_escaped$ = ~"An \"escaped\" (\\) string!\n..\a...\b...\f...\r...\t...\v"
;                      ^^       ^^  ^^         ^^  ^^   ^^   ^^   ^^   ^^   ^^  esc
;                 ^^^^^  ^^^^^^^   ^  ^^^^^^^^^  ^^  ^^^  ^^^  ^^^  ^^^  ^^^  ^ str    

; ==============================================================================
;-                             Non-Escaped Strings                              
; ==============================================================================
; Inside normal strings, they should not be highlighted as escape sequences:
non_escaped_str$ = "..\a...\b...\f...\n...\r...\t...\v...\\..."
;                     ^^   ^^   ^^   ^^   ^^   ^^   ^^   ^^ str

; ==============================================================================
;-                           Invalid Escape Sequences                           
; ==============================================================================
; PureBasic IDE catches malformed escaped sequences inside Escaped Strings, but
; the current 'purebasic.lang' syntax just ignores them -- in order to handle
; them properly we'd need a new native syntax element, like 'invalid'. See:
; 
;     https://gitlab.com/saalen/highlight/issues/101
;
; Presence of invalid escapes prevents compilation of a source file!

CompilerIf #False ; -> Required to make this file compile/run
  
  ; ------------------------------------------------------------------------------
  ;- Uppercased
  ; ------------------------------------------------------------------------------
  ; Uppercase versions of valid escapes are invalid:
  bad_uppercase$ = ~"..\A...\B...\F...\N...\R...\T...\V..."
  ;                    ^^   ^^   ^^   ^^   ^^   ^^   ^^ str
  
  ; ------------------------------------------------------------------------------
  ;- Unsupported
  ; ------------------------------------------------------------------------------
  ; Any escape sequence not in the list of supported escapes is invalid:
  bad_escapes$ = ~"...\c...\d...\e...\g...\z...\!...\0...\'..."
  ;                   ^^   ^^   ^^   ^^   ^^   ^^   ^^   ^^ str
CompilerEndIf
