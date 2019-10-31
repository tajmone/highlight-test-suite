dofile "test.lua"
--^ kwb

--[[a comment]] var=11
--                  ^ num
--                 ^ opt
--                  ^^ num

"             " var=11
--                  ^^ num
--                 ^ opt
--                  ^^ num

  var=111111111111111111111
--    ^^^^^^^^^^^^^^^^^^^^^ num

Strings={
  Delimiter=[["|']],
    --      ^^^^^^^ str
    --             ^ opt
  DelimiterPairs= {
    { Open=[[ \[=*\[ ]], Close=[[ \]=*\] ]], Raw=true }
    --     ^          ^ str                ^ opt
                  --   ^ opt   ^          ^ str  ^ kwa
  },
  AssertEqualLength=true
}


