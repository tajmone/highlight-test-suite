# ******************************************************************************
# *                                                                            *
# *                             Test Type Suffixes                             *
# *                                                                            *
# ******************************************************************************
# See:
#   https://nim-lang.org/docs/manual.html#lexical-analysis-numerical-constants
#   https://nim-lang.org/docs/tut1.html#basic-types-integers

# ==============================================================================
#                           Integer Literals Suffixes                           
# ==============================================================================
let
  i1 = 666'i8     # int8
#      ^^^^^^ num
  i2 = 666'i16    # int16
#      ^^^^^^^ num
  i3 = 666'i32    # int32
#      ^^^^^^^ num
  i4 = 666'i64    # int64
#      ^^^^^^^ num
  i5 = 666'u      # uint
#      ^^^^^ num
  i6 = 666'u8     # uint8
#      ^^^^^^ num
  i7 = 666'u16    # uint16
#      ^^^^^^^ num
  i8 = 666'u32    # uint32
#      ^^^^^^^ num
  i9 = 666'u64    # uint64
#      ^^^^^^^ num

# *** BUT NOT: *** 

var
  bad_i10 = 666'i       # Unlike 'u', 'i' without size is NOT valid!
#              ^^ str


# ==============================================================================
#                            Float Literals Suffixes                            
# ==============================================================================
var
  f1 = 0.0'f       # float32
#      ^^^^^ num
  f2 = 0.0'd       # float64
#      ^^^^^ num
  f3 = 0.0'f32     # float32
#      ^^^^^^^ num
  f4 = 0.0'f64     # float64
#      ^^^^^^^ num
  f5 = 0.0'f128    # float128
#      ^^^^^^^^ num

# EOF #
