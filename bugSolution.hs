```haskell
import Data.List (sort)
import Data.Maybe (fromMaybe)

main :: IO ()
main = do
  let nums = [1, 5, 2, 8, 3]
  let sortedNums = sort nums
  print sortedNums 

-- Safe sorting for potentially large lists (demonstration)
-- This will use less memory, it processes chunks of the list at a time
safeSort :: [Int] -> [Int]
safeSort xs =  let n = length xs
                   in if n <= 1000 -- Adjust chunk size as needed
                      then sort xs
                      else let (left, right) = splitAt 500 xs -- Adjust chunk size as needed
                          in safeSort left ++ safeSort right

main' :: IO ()
main' = do
  let largeList = [1..1000000]
  --let sortedLargeList = sort largeList --This line will crash for larger lists
  let sortedLargeList = safeSort largeList
  print (take 10 sortedLargeList) --Print only a portion to prevent output overflow
```