recRem :: Int -> Int -> Int
recRem x y | y <= 0 = error "we will only handle positive divisors"
-- TODO Finish this function (replace the placeholder value 9999. you may want more cases)
recRem x y | x < 0  = 1*(recRem (x+y) y)
--if it is a negative dividend we add until it is positive the first time
recRem x y | x > y  = 1*(recRem (x-y) y)
--if it is a positive dividend we subtract until we get it within range
recRem x y | otherwise = x

repeatHorizontal :: Int -> String -> String
-- TODO
repeatHorizontal 1 s = s
repeatHorizontal n s = s ++ (repeatHorizontal (n-1) s) 
--keep printing n-1 times until n reaches 1

alternate :: Int -> String -> String -> String
-- TODO
alternate 0 x y = ""
alternate n x y = x ++ alternate (n-1) y x 

--ignore the code below: (alternate way to work on it)
--alternate n x y | (n >= 2) = x ++ y  ++ (alternate (n-2) (x) (y))
-- keeps printing until n is 0 or 1 
--alternate n x y | n == 1 = x
-- if n is 1, it means it is odd and the first character is to be printed
--alternate n x y = "" 
-- if n is 0, it means it is even and nothing is to be printed
-- !!! this uses 2 base cases !!! - get checked

repeatVertical :: Int -> String -> String
-- TODO. The output string should begin and end with the input string - it should *not* have an extra newline at the beginning or end

repeatVertical n s = (alternate ((n*2)-1) (s) ("\n"))

checkerboard :: Int ->  Int -> String -> String -> String
-- TODO Finish this function, including writing the type signature and argument names. (You may want to create a separate helper function and/or some local variables. You can use your `alternate` function from above. It is acceptable if there is one extra newline at the beginning or end)

checkerboard n m str1 str2 | n == 0 = "" -- base case: n is 0 we do not print
                           | otherwise = alternate m str1 str2 ++ "\n" ++ checkerboard (n-1) m str2 str1
                           -- otherwise we print the alternating versions of string 1 and 2 and then we call checkerboard to complete the rest for the next line with switched strings


------------------
-- A few simple tests
------------------

-- Don't worry about the "do" syntax, as this is using Monads which is out of scope for this assignment. Instead, just keep main as a simple list of prints/putStrLns, and do all the real work in the non-Monadic functions above. You may add additional tests.

main = do
  print (recRem 80 6)  -- 2
  print (recRem (-80) 6)  -- 4
  putStrLn (repeatHorizontal 3 "hi") -- "hihihi"
  putStrLn (alternate 5 "x" "y") -- "xyxyx"
  putStrLn (repeatVertical 3 "hi")
{-
hi
hi
hi
-}
  putStrLn (checkerboard 3 5 "a" "b")
{-
ababa
babab
ababa
-}
  putStrLn ("MORE TEST CASES:")
  putStrLn (repeatHorizontal 4 "hi") -- "hihihihi"
  putStrLn (alternate 8 "x" "y") -- "xyxyxy"
  putStrLn (repeatVertical 10 "hi")
{-
hi
hi
hi
hi
hi
hi
hi
hi
hi
hi
-}
  putStrLn (checkerboard 6 4 "j" "k")
{-
jkjk
kjkj
jkjk
kjkj
jkjk
kjkj
-}
