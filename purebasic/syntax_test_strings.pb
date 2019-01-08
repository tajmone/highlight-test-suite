; ******************************************************************************
; *                                                                            *
; *                                Strings Test                                *
; *                                                                            *
; ******************************************************************************
; PureBASIC 5.62
; ------------------------------------------------------------------------------

; ==============================================================================
;-                               Literal Strings                                
; ==============================================================================
; The only literal string delimiter is the double quotes character.

string_plain.s = "I'm a plain string."
;                ^^^^^^^^^^^^^^^^^^^^^ str

; ==============================================================================
;-                               Escaped Strings                                
; ==============================================================================
; By prefixing a tilda to a literal string the following escape sequences are
; supported:
;   \a  : alarm           Chr(7)
;   \b  : backspace       Chr(8)
;   \f  : formfeed        Chr(12)
;   \n  : newline         Chr(10)
;   \r  : carriage return Chr(13)
;   \t  : horizontal tab  Chr(9)
;   \v  : vertical tab    Chr(11)
;   \"  : double quote    Chr(34)
;   \\  : backslash       Chr(92)

string_escaped$ = ~"An \"escaped\" (\\) string!\n..\a...\b...\f...\r...\t...\v"
;                      ^^       ^^  ^^         ^^  ^^   ^^   ^^   ^^   ^^   ^^  esc
;                 ^^^^^  ^^^^^^^   ^  ^^^^^^^^^  ^^  ^^^  ^^^  ^^^  ^^^  ^^^  ^ str    
