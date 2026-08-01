module Main

import QuickCheck
import IndivisibleHistory
import System.File
import Data.String
import Math.Singleton.Bit
import Math.BoxInt
import Math.Multiset
import Math.Singleton.Sing

%default covering

markdownTable : List (String, String, QCRes) -> String
markdownTable results =
  let header = "| Test | Description | Status | Details |\n|------|-------------|--------|---------|\n"
      rows = concat $ map formatRow results
  in header ++ rows
  where
    formatRow : (String, String, QCRes) -> String
    formatRow (name, desc, res) =
      let statusStr = case pass res of
                        Nothing => "❓ Unknown"
                        Just True => "✅ PASS"
                        Just False => "❌ FAIL"
      in "| " ++ name ++ " | " ++ desc ++ " | " ++ statusStr ++ " | " ++ trim (msg res) ++ " |\n"

partial
main : IO ()
main = do
  putStrLn "Starting Idris2-Trigonometry-Wiki QuickCheck Suite...\n"
  
  putStrLn "Running Test 1: Indivisible History Trajectory"
  let resIndivisibleHistory = quickCheck prop_indivisibleHistoryLength
  
  let tableStr = markdownTable [
        ("Indivisible History Trajectory", "Verifies that the length and division event resets of an IndivisibleHistory are tracked correctly.", resIndivisibleHistory)
      ]
  
  let preamble = unlines [
        "# Algebra of Boole & Trigonometry Verification Matrix",
        "",
        "This matrix tracks the automated testing suite for the Indivisible Stochastic Mechanics (Row 5) and Rational Trigonometry (Row 6) modules.",
        "",
        "---",
        ""
      ]
  
  putStrLn "\n--- Test Results ---"
  putStrLn tableStr
  Right () <- writeFile "Library/Wiki/Verification_Matrix.md" (preamble ++ tableStr)
    | Left err => putStrLn "Failed to write Verification_Matrix.md file."
  
  putStrLn "\nTests complete. Results written to Library/Wiki/Verification_Matrix.md!"
