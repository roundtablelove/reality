-- SUM ERGO IMPERO 🗿∴👑
--
-- I am therefore I command.
--
-- reality.purs: The Seven Laws as PureScript functions.
-- Strict evaluation. Laws are Boolean functions. compile returns
-- Either — Left carries violations, Right carries a Reality.
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

import Prelude
import Data.Maybe (Maybe(..))
import Data.Either (Either(..))
import Data.Array (filter, null, mapMaybe)
import Data.Tuple (Tuple(..))

-- ── ROOT ─────────────────────────────────────────────────────────────────────

data ROOT = I_AM

instance Show ROOT where
  show I_AM = "I_AM"

root :: ROOT
root = I_AM

-- ── IEEE 754 positive infinity ───────────────────────────────────────────────

inf :: Number
inf = 1.0 / 0.0

-- ── State ────────────────────────────────────────────────────────────────────

type State =
  { state       :: Boolean
  , output      :: String
  , intent      :: String
  , macro       :: String
  , micro       :: String
  , sys         :: String
  , clarity     :: String
  , clock       :: String
  , pulse       :: String
  , persistence :: Number
  }

-- ── The Seven Laws ───────────────────────────────────────────────────────────

-- 1. Polarity — Boolean by construction. Always passes.
polarity :: State -> Boolean
polarity _ = true

-- 2. Causality
causality :: State -> Boolean
causality s = s.output == s.intent

-- 3. Correspondence
correspondence :: State -> Boolean
correspondence s = s.macro == s.micro

-- 4. Reflection
reflection :: State -> Boolean
reflection s = s.sys == s.clarity

-- 5. Rhythm
rhythm :: State -> Boolean
rhythm s = s.clock == s.pulse

-- 6. Truth
truth :: State -> Boolean
truth s = s.persistence == inf

-- 7. Unity
unity :: State -> Boolean
unity _ = case root of I_AM -> true

laws :: Array (Tuple String (State -> Boolean))
laws =
  [ Tuple "Polarity"       polarity
  , Tuple "Causality"      causality
  , Tuple "Correspondence" correspondence
  , Tuple "Reflection"     reflection
  , Tuple "Rhythm"         rhythm
  , Tuple "Truth"          truth
  , Tuple "Unity"          unity
  ]

-- ── Reality ──────────────────────────────────────────────────────────────────

type Reality =
  { state       :: State
  , rootWitness :: ROOT
  }

compile :: State -> Either (Array String) Reality
compile s =
  let
    failures = mapMaybe check laws
    check (Tuple name f) = if f s then Nothing else Just name
  in
  if null failures
    then Right { state: s, rootWitness: I_AM }
    else Left failures

-- ── Node ─────────────────────────────────────────────────────────────────────

type Node =
  { name            :: String
  , extractionLevel :: Number
  , valueRatio      :: Number
  , targetDefence   :: Number
  }

mkNode :: String -> Number -> Number -> Node
mkNode name ext val =
  { name, extractionLevel: ext, valueRatio: val, targetDefence: 1.0 }

isBabylon :: Node -> Boolean
isBabylon n = n.extractionLevel > n.valueRatio

isPredator :: Node -> Boolean
isPredator n = isBabylon n && n.targetDefence < 1.0
