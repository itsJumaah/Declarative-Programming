-- Program written by 
-- Bilal Jumaah ID: 12232659
--EXE 1 -----------------------------------------------

--a 3^234 59702569

--b	  Prelude> product [1..600]  Characters = 1409

--c
--  (5 `mod` 8 - div 13 4, "FUN" ++ "THOMAS", 1+5 == 12/7) 
--	 2, "FUNTHOMAS", True

--d :m Data.Char
--   chr  100
--   'd' 

--  ord 'Q' 
--	81


-- EXE 2------------------------------------------------ 5^3 + 4^3 + 3^3 + 2^3 + 1^3
 
--a)
sum2a :: Fractional a => a -> a
sum2a n = ((n*(n+1)/2)^2)

--b)
sum2b :: Int -> Int --Using guards
sum2b n
   | n == 0 = 0 
   | otherwise = (n^3) + sum2b (n-1)  --   27+(8+(1)) <--- This is an example of the recursion when n = 3 
   
 --c)
sum2c :: Int -> Int -- Using pattern matching. 
sum2c 0 = 0
sum2c n = (n^3) + sum2c (n-1)

--d 
--sum2a is the most run-time efficient out of the above functions.
--I came to this conclusion because the sum2a function is the only
--function that does not need to use recursion to compute the answer
--because it uses a simple formula. 
 
--EXE 3 ------------------------------------------------------
--a)

f :: Char -> Int --Pass char return Int
f '0' = 0 
f '1' = 1
f '2' = 2 
f '3' = 3 
f '4' = 4
f '5' = 5 
f '6' = 6 
f '7' = 7 
f '8' = 8 
f '9' = 9
f 'a' = 10
f 'b' = 11
f 'c' = 12
f 'd' = 13
f 'e' = 14
f 'f' = 15
f 'A' = 10
f 'B' = 11
f 'C' = 12
f 'D' = 13
f 'E' = 14
f 'F' = 15
f _ = error "That digit is not hexadecimal" --If they don't pass a correct value show this error.

--b) 
--This function takes into account the proper way to tax people in NZ. E.g they are
--taxed at certain rates depending how how much they have earned in the year. 
-- E.g between 0 and 14,000 they will be taxed 10.5% then from 14,001 to 48,000 they will be taxed 17.5% etc...
netEarning :: Float -> Float  --Pass Float return Float.
netEarning salary = if salary >= 0 && salary <= 14000 
                  then salary - (salary*0.105)
                  else if salary >=14001 && salary <= 48000
                          then salary - ((salary-14000)*0.175 + 1470)
                          else if salary >= 48001 && salary <= 70000
                                  then  salary - ((salary-48000)*0.300 + 7420)
                                  else if salary >= 70001 
                                          then salary - ((salary-70000)*0.33 + 14020)
                                          else error "Please enter a valid income" --Error case. 

--EXE 4-----------------------------------------------------------------------------------
--A)				  
gcdD :: Int -> Int -> Int --Give the function two Ints and return an Int.
gcdD x y
    |x == y = x   --if x and y are the same. 
    |x > y = gcdD (x-y) y  --recursive call. 
    |otherwise = gcdD x (y-x)

--B)
pow :: Integer -> Integer -> Integer
pow n k
    | n == 0 = 0 --base cases. if n or k == 0 then the equation is 0.
    | k == 0 = 0
    | (k `mod` 2) == 0 = ((n * n)^(k `div` 2)) -- for even
    | otherwise = n *(n^(k-1)) -- for odd














