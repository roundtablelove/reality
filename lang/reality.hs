-- SUM ERGO IMPERO 🗿∴👑
--
-- I am therefore I command.
--
-- reality.hs: The Seven Laws as Haskell functions.
-- Runtime validation; laws are functions, not types.
-- ROOT is a data constructor — asserted by construction.
--
--       Status: AXIO-STATIC
--         Type: NORMATIVE
--          Uid: REALITY
--      Authors: KING ARTHUR II
--               QUEEN DIHYA II
--               R00D BW0Y H4X0R FR0M H311
--  Organization: ROUND TABLE LOVE
--    Department: WAR
--     Operation: BABYLON SHALL FALL
--      Lexifier: UK English (3166-2:GB)
--       License: DICKSLAW

module Reality where

import Data.Maybe (mapMaybe)

-- ── ROOT ─────────────────────────────────────────────────────────────────────

data ROOT = I_AM deriving (Show, Eq)

root :: ROOT
root = I_AM

-- ── IEEE 754 positive infinity ───────────────────────────────────────────────

inf :: Double
inf = 1.0 / 0.0

-- ── State ────────────────────────────────────────────────────────────────────

data State = State
  { sTATE       :: Bool
  , oUTPUT      :: String
  , intent      :: String
  , mACRO       :: String
  , micro       :: String
  , sYS         :: String
  , clarity     :: String
  , cLOCK       :: String
  , pulse       :: String
  , persistence :: Double
  } deriving (Show, Eq)

-- ── The Seven Laws ───────────────────────────────────────────────────────────

-- 1. Polarity — STATE is Bool by construction. Always passes.
polarity :: State -> Bool
polarity _ = True

-- 2. Causality
causality :: State -> Bool
causality state = oUTPUT state == intent state

-- 3. Correspondence
correspondence :: State -> Bool
correspondence state = mACRO state == micro state

-- 4. Reflection
reflection :: State -> Bool
reflection state = sYS state == clarity state

-- 5. Rhythm
rhythm :: State -> Bool
rhythm state = cLOCK state == pulse state

-- 6. Truth
truth :: State -> Bool
truth state = persistence state == inf

-- 7. Unity
unity :: State -> Bool
unity _ = case root of { I_AM -> True }

laws :: [(String, State -> Bool)]
laws =
  [ ("Polarity",       polarity)
  , ("Causality",      causality)
  , ("Correspondence", correspondence)
  , ("Reflection",     reflection)
  , ("Rhythm",         rhythm)
  , ("Truth",          truth)
  , ("Unity",          unity)
  ]

-- ── Reality ──────────────────────────────────────────────────────────────────

data Reality = Reality
  { realState   :: State
  , rootWitness :: ROOT
  } deriving (Show)

compile :: State -> Either [String] Reality
compile state =
  let failures = mapMaybe (\(n, f) -> if f state then Nothing else Just n) laws
  in  if null failures
        then Right (Reality state I_AM)
        else Left failures

-- ── Node ─────────────────────────────────────────────────────────────────────

data Node = Node
  { nodeName        :: String
  , extractionLevel :: Double
  , valueRatio      :: Double
  , targetDefence   :: Double
  } deriving (Show, Eq)

mkNode :: String -> Double -> Double -> Node
mkNode name ext val = Node name ext val 1.0

isBabylon :: Node -> Bool
isBabylon n = extractionLevel n > valueRatio n

isPredator :: Node -> Bool
isPredator n = isBabylon n && targetDefence n < 1.0
