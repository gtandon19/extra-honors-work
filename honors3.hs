main = do
  print (lcsLen [6,1,3,7,5] [1,9,6,2,3,8,4,5]) -- should be 3 (for e.g. [6,3,5])
  --recall that a string in Haskell is just a list of characters:
  print (lcsLen "math" "search") -- should be 2 (for "ah")
  -- you can add more tests here
  print (lcsLen [1,1,3,7,5] [1,1,6,2,3,8,4,5])
-- This type signature just means that we're taking in two lists of the same type, and returning an integer. "[a]" means the list can be of anything (as opposed to e.g. "[Int]" which would require it to be a list specifically of integers), as long as the items meet the "(Eq a)" requirement, i.e. that they can be compared to each other with "=="
lcsLen :: (Eq a) => [a] -> [a] -> Int
-- delete the line below and write your code here
--lcsLen xs ys = 9999
lcsLen [] (xs) = 0
lcsLen (xs) [] = 0
lcsLen (a:xs) (b:ys) | (a==b) = (lcsLen (xs) (ys)) + (1)
                     | lcsLen (a:xs) (ys) > lcsLen (xs) (b:ys) = lcsLen (a:xs) (ys)
                     | otherwise = (lcsLen (xs) (b:ys))
                     
                     
{- 
Pt 2:
 Write a proof by induction that your “lcsLen” algorithm is correct, i.e. a proof of the the following claim: “For any lists l1 and l2, lcsLen returns the length of some longest common sublist.” To make the proof easier you may assume that within a list there are no duplicate values (but your code should still work even if there are duplicates). (Make sure your ‘induction variable’ is something that decreases in every recursive call.)

Prove that: For any lists l1 and l2, lcsLen returns the length of some common sublist.
Proof by induction on k, which is the length of the both the lists combined.

Base case: If k=0, then both lists are empty so the integer returned needs to be 0 which is what lcsLen does.

Induction Hypothesis: Let k > 0. Suppose that lcslen returns the length of the longest common sublist for any lists l1, l2 with combined length of n>0 to n=k-1.

Induction Step: 
Case 1: When k = length of l1, that means that length of l2 is 0, so there is no common sublist, so it returns a 0.
Case 2: When k = length of l2, that means that length of l1 is 0, so there is no common sublist, so it returns a 0.
Case 3: Otherwise, let a be the first item of the l1, b be the first item of l2.
If we take a longest common sublist of the 2 lists:
If a and b are equal to the first element of LCS, then the rest of the sublist is in rest of rest of l1, 




 l1 is an empty list, then there is no common sublist, and so the integer returned needs to be 0, which is what lcsLen does.
Base case 2: If l2 is an empty list, then there is no common sublist, and so the integer returned needs to be 0, which is what lcsLen does.

Induction Hypothesis: Suppose that lcslen returns the length of the longest common sublist when 


-}
