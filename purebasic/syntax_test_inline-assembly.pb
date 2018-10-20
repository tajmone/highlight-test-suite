; ******************************************************************************
; *                                                                            *
; *                            Inline Assembly Test                            *
; *                                                                            *
; ******************************************************************************
; PureBASIC 5.62 | Runs both in x86 and x64
; ------------------------------------------------------------------------------

; Assembly keywords are highlighted as Keywords Group 2 (kwb)

MyVar.l = 3

EnableASM
;<^^^^^^^ kwa
  MOV MyVar, 665 ; Mix ASM keywords with PureBasic variables
; ^^^ kwb    ^^^ num
;     ^^^^^^ std ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ slc
  INC MyVar
; ^^^ kwb ^  std
DisableASM

If MyVar = 666
  MessageRequester("Inline Assembly", "Test passed: " + MyVar)
  ;<^^^^^^^^^^^^^^ kwc
Else
  MessageRequester("Inline Assembly", "Test failed", #PB_MessageRequester_Error)
EndIf
