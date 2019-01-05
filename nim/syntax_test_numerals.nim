# ******************************************************************************
# *                                                                            *
# *                          Test Numerical Constants                          *
# *                                                                            *
# ******************************************************************************
# See:
#   https://nim-lang.org/docs/manual.html#lexical-analysis-numerical-constants
#   https://nim-lang.org/docs/tut1.html#lexical-elements-numbers

# ==============================================================================
#                                    Decimals                                   
# ==============================================================================
var
  d1 = 666
#      ^^^ num
  d2 = 1_000_000
#      ^^^^^^^^^ num

# ==============================================================================
#                                  Hexadecimals                                 
# ==============================================================================
var
  h1 = 0xDEADBEEF
#      ^^^^^^^^^^ num
  h2 = 0XDEADBEEF    # Uppercase '0x'
#      ^^^^^^^^^^ num
  h3 = 0xDEAD_BEEF   # Underscore separator
#      ^^^^^^^^^^^ num
  h4 = 0XDEAD_BEEF   # Uppercase '0x' + Underscore separator
#      ^^^^^^^^^^^ num
  h5 = 0x6789ABCD
#      ^^^^^^^^^^ num
  h6 = 0x6789_ABCD   # Underscore separator
#      ^^^^^^^^^^^ num

# ------------------------------------------------------------------------------
# Hexadecimal Float Literals
# ------------------------------------------------------------------------------
# Floating point literals may also be in hexadecimal notation:

var
  hf1 = 0xDEADBEEF'f
#       ^^^^^^^^^^^^ num
  hf2 = 0xDEADBEEF'f32
#       ^^^^^^^^^^^^^^ num
  hf3 = 0xDEADBEEF'f64
#       ^^^^^^^^^^^^^^ num
  hf4 = 0xDEADBEEF'f128
#      ^^^^^^^^^^^^^^^^ num
  hf5 = 0xDEADBEEF'd
#       ^^^^^^^^^^^^ num

# ==============================================================================
#                                     Octals                                    
# ==============================================================================
var
  o1 = 0o007
#      ^^^^^ num
  o2 = 0o007_333   # Underscore separator
#      ^^^^^^^^^ num

# *** BUT NOT: *** 

var
  bad_o3 = 0O007       # Uppercase '0o' is NOT valid!
#          ^^^^^ std


# ------------------------------------------------------------------------------
# Octal Float Literals
# ------------------------------------------------------------------------------
# Floating point literals may also be in  octal notation:

var
  of1 = 0o007'f
#       ^^^^^^^ num
  of2 = 0o007'f32
#       ^^^^^^^^^ num
  of3 = 0o007'f64
#       ^^^^^^^^^ num
  of4 = 0o007'f128
#       ^^^^^^^^^^^ num
  of5 = 0o007'd
#       ^^^^^^^ num


# ==============================================================================
#                                    Binaries                                   
# ==============================================================================
var
  h1 = 0b01001011
#      ^^^^^^^^^^ num
  h2 = 0B01001011   # Uppercase '0b'
#      ^^^^^^^^^^ num
  h3 = 0b0100_1011   # Underscore separator
#      ^^^^^^^^^^^ num
  h4 = 0B0100_1011   # Uppercase '0b' + Underscore separator
#      ^^^^^^^^^^^ num

# ------------------------------------------------------------------------------
# Binary Float Literals
# ------------------------------------------------------------------------------
# Floating point literals may also be in binary notation:

var
  hf1 = 0b01001011'f
#       ^^^^^^^^^^^^ num
  hf1 = 0b01001011'f32
#       ^^^^^^^^^^^^^^ num
  hf1 = 0b01001011'f64
#       ^^^^^^^^^^^^^^ num
  hf1 = 0b01001011'f128
#       ^^^^^^^^^^^^^^^  num
  hf1 = 0b01001011'd
#       ^^^^^^^^^^^^ num

# ==============================================================================
#                                     Floats                                    
# ==============================================================================
var
  f1 = 28.0
#      ^^^^ num
  f2 = 2e+33           # Exponent +
#      ^^^^^^^^num
  f3 = 2E-33           # Uppercase Exponent -
#      ^^^^^^^^num
  f2 = 6.02e+23        # Exponent +
#      ^^^^^^^^num
  f3 = 6.02e-23        # Exponent -
#      ^^^^^^^^num
  f2 = 6.02E+23        # Uppercase Exponent +
#      ^^^^^^^^num
  f3 = 6.02E-23        # Uppercase Exponent -
#      ^^^^^^^^num
  f4 = 3.141592653
#      ^^^^^^^^^^^ num
  f5 = 3.141_592_653   # Underscore separator
#      ^^^^^^^^^^^^^ num
  f6 = 0E0
#      ^^^ num


# EOF #
