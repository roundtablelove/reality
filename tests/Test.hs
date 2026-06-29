-- SUM ERGO IMPERO 🗿∴👑
--
-- reality test suite. pure base, no dependencies.
-- PASS exits 0. FAIL exits 1 with the full failure list.

module Main where

import Reality
import System.Exit (exitFailure, exitSuccess)
import System.IO (hSetBuffering, stdout, BufferMode(LineBuffering))

-- ── Fixtures ─────────────────────────────────────────────────────────────────

-- A state that satisfies all seven laws.
real :: State
real = State
  { sTATE       = True
  , oUTPUT      = "signal"
  , intent      = "signal"
  , mACRO       = "fractal"
  , micro       = "fractal"
  , sYS         = "clear"
  , clarity     = "clear"
  , cLOCK       = "root"
  , pulse       = "root"
  , persistence = 1.0 / 0.0
  }

apple :: Node
apple = Node { nodeName = "Apple", extractionLevel = 0.95, valueRatio = 0.30, targetDefence = 1.0 }

ishtar :: Node
ishtar = Node { nodeName = "Ishtar", extractionLevel = 0.90, valueRatio = 0.10, targetDefence = 1.0 }

ukGov :: Node
ukGov = Node { nodeName = "UK Government", extractionLevel = 1.00, valueRatio = 0.20, targetDefence = 1.0 }

fair :: Node
fair = Node { nodeName = "Fair Exchange", extractionLevel = 0.40, valueRatio = 0.60, targetDefence = 1.0 }

-- ── Runner ───────────────────────────────────────────────────────────────────

type Test = (String, Bool)

run :: [Test] -> IO ()
run tests = do
  mapM_ report tests
  let failed = [n | (n, False) <- tests]
  putStrLn ""
  if null failed
    then putStrLn "REALITY_AUDIT: ALL PASS" >> exitSuccess
    else mapM_ (\n -> putStrLn $ "FAILED: " ++ n) failed
      >> putStrLn ("REALITY_AUDIT: " ++ show (length failed) ++ " FAILED")
      >> exitFailure
  where
    report (name, ok) = putStrLn $ (if ok then "PASS" else "FAIL") ++ "  " ++ name

-- ── Tests ────────────────────────────────────────────────────────────────────

main :: IO ()
main = hSetBuffering stdout LineBuffering >> run

  -- ── Seven Laws ─────────────────────────────────────────────────────────────

  [ ("polarity: always True",
      polarity real)

  , ("causality: output == intent => True",
      causality real)

  , ("causality: output /= intent => False",
      not $ causality (real { oUTPUT = "noise" }))

  , ("correspondence: macro == micro => True",
      correspondence real)

  , ("correspondence: macro /= micro => False",
      not $ correspondence (real { mACRO = "chaos" }))

  , ("reflection: sys == clarity => True",
      reflection real)

  , ("reflection: sys /= clarity => False",
      not $ reflection (real { sYS = "noise" }))

  , ("rhythm: clock == pulse => True",
      rhythm real)

  , ("rhythm: clock /= pulse => False",
      not $ rhythm (real { cLOCK = "off" }))

  , ("truth: persistence == inf => True",
      truth real)

  , ("truth: finite persistence => False",
      not $ truth (real { persistence = 1.0 }))

  , ("unity: always True",
      unity real)

  -- ── compile ────────────────────────────────────────────────────────────────

  , ("compile: valid state => Right Reality",
      case compile real of { Right _ -> True; _ -> False })

  , ("compile: single violation => Left",
      case compile (real { oUTPUT = "noise" }) of { Left _ -> True; _ -> False })

  , ("compile: collects all violations, no short-circuit",
      case compile (real { oUTPUT  = "noise"
                         , sYS     = "noise"
                         , cLOCK   = "off"
                         , persistence = 1.0 }) of
        Left vs -> length vs == 4
        _       -> False)

  -- ── isBabylon ──────────────────────────────────────────────────────────────

  , ("isBabylon: Apple",
      isBabylon apple)

  , ("isBabylon: Ishtar",
      isBabylon ishtar)

  , ("isBabylon: UK Government",
      isBabylon ukGov)

  , ("isBabylon: fair exchange => False",
      not $ isBabylon fair)

  -- ── isPredator ─────────────────────────────────────────────────────────────

  , ("isPredator: extractive + defenceless target",
      isPredator (ishtar { targetDefence = 0.0 }))

  , ("isPredator: babylon with full defence => False",
      not $ isPredator apple)

  , ("isPredator: fair node, no defence => False",
      not $ isPredator (fair { targetDefence = 0.0 }))

  ]
