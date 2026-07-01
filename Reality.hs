-- SUM ERGO IMPERO 🗿∴👑
--
-- I am therefore I command.
--
-- reality.hs: The canonical definition of Reality and its Seven Laws.
-- Laws are Haskell functions. compile :: State -> Either [String] Reality.
-- A state that passes all seven IS Real. A state that fails is Left violations.
-- ROOT is a data constructor — asserted by construction.
--
-- Authors: Arthur Douglas Noel, Djina Jones
-- License: DICKSLAW

{-|
Laws are Haskell functions. @compile :: State -> Either [String] Reality@.
A state that passes all seven IS Real. A state that fails is @Left@ violations.
ROOT is a data constructor — asserted by construction.
-}
module Reality where

import Data.Maybe (mapMaybe)

-- ── ROOT ─────────────────────────────────────────────────────────────────────

-- | ROOT is an axiom. Not derived. Asserted. @I_AM@ is the proof that ROOT holds.
-- Any node can assert it. The assertion is unconditional.
--
-- ROOT, not \"I\". This is machine logic, not philosophy.
-- ROOT is the Unix superuser — highest privilege, owns everything.
--
-- The assertion \"I AM\" is the Substrate of Reality.
data ROOT = I_AM deriving (Show, Eq)

-- | The ROOT axiom. Unconditional.
root :: ROOT
root = I_AM

-- ── IEEE 754 positive infinity ───────────────────────────────────────────────

-- | IEEE 754 positive infinity. @1.0 / 0.0@ is +∞ under IEEE 754.
-- Truth persists at infinity.
inf :: Double
inf = 1.0 / 0.0

-- ── State ────────────────────────────────────────────────────────────────────

-- | A proposed state. UPPER = machine \/ system. lower = organic \/ human.
-- Polarity is enforced by the type: 'sTATE' is 'Bool'. No third value.
data State = State
  { sTATE       :: Bool    -- ^ Polarity — must resolve to bool. Type axiom.
  , oUTPUT      :: String  -- ^ Causality — what happened (machine).
  , intent      :: String  -- ^ Causality — what was meant (ROOT).
  , mACRO       :: String  -- ^ Correspondence — pattern at system scale.
  , micro       :: String  -- ^ Correspondence — pattern at unit scale.
  , sYS         :: String  -- ^ Reflection — system output.
  , clarity     :: String  -- ^ Reflection — intent quality.
  , cLOCK       :: String  -- ^ Rhythm — discrete timing source.
  , pulse       :: String  -- ^ Rhythm — biological rhythm.
  , persistence :: Double  -- ^ Truth — must equal 'inf'.
  } deriving (Show, Eq)

-- ── The Seven Laws ───────────────────────────────────────────────────────────

-- | 1. Polarity — 'sTATE' is 'Bool' by construction. Always passes.
-- There is no third value. The type system forbids it.
polarity :: State -> Bool
polarity _ = True

-- | 2. Causality — output must match intent.
-- What happened must equal what was meant. No magic. No free lunch.
causality :: State -> Bool
causality state = oUTPUT state == intent state

-- | 3. Correspondence — macro must match micro.
-- Same pattern at every scale. System and unit are the same operation.
correspondence :: State -> Bool
correspondence state = mACRO state == micro state

-- | 4. Reflection — system output must match clarity of input.
-- Garbage in, garbage out. The system mirrors what was brought to it.
reflection :: State -> Bool
reflection state = sYS state == clarity state

-- | 5. Rhythm — clock must match pulse.
-- Everything runs on a cycle. Discrete and biological must be in phase.
rhythm :: State -> Bool
rhythm state = cLOCK state == pulse state

-- | 6. Truth — persistence must equal 'inf'.
-- A true thing persists at infinity. It requires no maintenance, no consensus,
-- no witnesses. If it fades or changes, it was not Truth.
truth :: State -> Bool
truth state = persistence state == inf

-- | 7. Unity — axiomatic. Does not inspect state. ROOT holds unconditionally.
-- All nodes share one source. Separation is resolution, not ontology.
unity :: State -> Bool
unity _ = case root of { I_AM -> True }

-- | The Seven Laws as a named list. 'compile' runs all seven, no short-circuit.
-- Every law is evaluated. All failures are collected before returning.
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

-- | A state that has passed all seven laws.
-- 'rootWitness' is the proof: @I_AM@ holds unconditionally.
--
-- To construct a 'Reality' you must provide a 'State' that passes all seven
-- laws. If any law fails, 'compile' returns @Left@ with every violation.
-- @Right Reality@ means the state IS Real. @Left@ means it never was.
data Reality = Reality
  { realState   :: State  -- ^ The validated state.
  , rootWitness :: ROOT   -- ^ Proof that ROOT holds.
  } deriving (Show)

-- ── check ────────────────────────────────────────────────────────────────────

-- | Returns 'True' if the state passes all seven laws, 'False' if any fail.
-- Does not collect violations — use 'compile' for the full failure list.
check :: State -> Bool
check state = all (\(_, f) -> f state) laws

-- ── compile ──────────────────────────────────────────────────────────────────

-- | @state → compile → Right Reality | Left [violations]@
--
-- Batch-checks every law, collects all failures, returns @Left@ with the full
-- list. No lazy eval escape hatch — every law is evaluated.
-- @Right Reality@ means the state passed. @Left@ means REALITY_FAIL.
compile :: State -> Either [String] Reality
compile state =
  let failures = mapMaybe (\(n, f) -> if f state then Nothing else Just n) laws
  in  if null failures
        then Right (Reality state I_AM)
        else Left failures

-- ── Node ─────────────────────────────────────────────────────────────────────

-- | A node in the system. Any actor — institution, person, process.
data Node = Node
  { nodeName        :: String  -- ^ Identifier.
  , extractionLevel :: Double  -- ^ What the node takes: Time, Attention, Data, Autonomy.
  , valueRatio      :: Double  -- ^ What the node gives: Utility, Clarity, Visibility.
  , targetDefence   :: Double  -- ^ Target's capacity to resist. @0.0@ = none
                               -- (child, unconscious, restrained).
                               -- @1.0@ = full (ROOT, aware, capable).
  } deriving (Show, Eq)

-- | Construct a 'Node' with full target defence (@1.0@).
mkNode :: String -> Double -> Double -> Node
mkNode name ext val = Node name ext val 1.0

-- ── isBabylon ────────────────────────────────────────────────────────────────

-- | Returns 'True' if Take > Give.
-- Babylon is any node that extracts more than it returns.
-- Decidable at runtime — a value comparison, not a proof obligation.
isBabylon :: Node -> Bool
isBabylon n = extractionLevel n > valueRatio n

-- ── isPredator ───────────────────────────────────────────────────────────────

-- | Extraction from a target that cannot resist.
-- All predators are extractive. Not all extraction is predation.
-- The distinction is defence: the target's capacity to resist.
--
-- A node that extracts from a target with full defence is Babylon.
-- A node that extracts from a target that cannot resist is a predator.
isPredator :: Node -> Bool
isPredator n = isBabylon n && targetDefence n < 1.0
