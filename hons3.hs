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

Let the length of list l1 be n, and length of list l2 be m. Let n<=m without loss of generality.

Proof by induction on n, which is the length of list 1.

Base case: If n=0, then there is no common sublist. lcsLen returns 0 for these cases, and so the algorithm holds.

Induction Hypothesis: Let lcsLen of l1, l2 be k. For length of l1 = n.

Induction Step: 
Suppose we add another element to and increase length to n+1.
Case 1: When the n+1th element is not present in l2:
Then by induction hypothesis we know lcsLen already returns the length of the largest common sublist (k).
Case 2: When the n+1th element is present in l2:
Then the lcsLen function will return (k+1) which is what we needed to show.

Hence the algorithm works.

-}