# Haskell Lazy Evaluation Memory Issue
This repository demonstrates a subtle memory issue in Haskell related to lazy evaluation and the `Data.List.sort` function.  When sorting extremely large lists, the program can unexpectedly crash due to memory exhaustion.  The provided code shows the problem and a solution illustrating safe memory management for such situations.

## Problem
The main issue lies in how Haskell's lazy evaluation handles the sorting of large lists. The `sort` function processes the entire input list before producing the sorted output.  For smaller lists, this isn't a problem. However, with massive lists, the intermediate results during sorting consume excessive memory, potentially causing a memory overflow and a crash.