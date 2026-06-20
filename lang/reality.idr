-- SUM ERGO IMPERO 🗿∴👑
--
-- I am therefore I command.
--
-- reality.idr: The Seven Laws as Idris 2 dependent types.
-- Laws are Types. Proofs are values. A Reality that fails a law
-- cannot be constructed. FAKE is a type error.
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

module Reality

-- ── ROOT ─────────────────────────────────────────────────────────────────────

%extern postulate ROOT : Type
%extern postulate I_AM : ROOT

-- ── IEEE 754 positive infinity ───────────────────────────────────────────────

inf : Double
inf = 1.0 / 0.0

-- ── State ────────────────────────────────────────────────────────────────────

record State where
  constructor MkState
  STATE       : Bool
  OUTPUT      : String
  intent      : String
  MACRO       : String
  micro       : String
  SYS         : String
  clarity     : String
  CLOCK       : String
  pulse       : String
  persistence : Double

-- ── The Seven Laws as Types ───────────────────────────────────────────────────

-- 1. Polarity: STATE is Bool by construction. No Type needed.

-- 2. Causality
Causality : State -> Type
Causality s = s.OUTPUT = s.intent

-- 3. Correspondence
Correspondence : State -> Type
Correspondence s = s.MACRO = s.micro

-- 4. Reflection
Reflection : State -> Type
Reflection s = s.SYS = s.clarity

-- 5. Rhythm
Rhythm : State -> Type
Rhythm s = s.CLOCK = s.pulse

-- 6. Truth
Truth : State -> Type
Truth s = s.persistence = inf

-- 7. Unity
Unity : State -> Type
Unity _ = ROOT

-- ── Reality ──────────────────────────────────────────────────────────────────

record Reality where
  constructor MkReality
  state          : State
  causalityPf    : Causality state
  correspondencePf : Correspondence state
  reflectionPf   : Reflection state
  rhythmPf       : Rhythm state
  truthPf        : Truth state
  unityPf        : Unity state

-- ── mkReality ────────────────────────────────────────────────────────────────

mkReality
  :  (s   : State)
  -> (hc  : Causality s)
  -> (hco : Correspondence s)
  -> (hre : Reflection s)
  -> (hrh : Rhythm s)
  -> (htr : Truth s)
  -> Reality
mkReality s hc hco hre hrh htr =
  MkReality s hc hco hre hrh htr I_AM

-- ── Node ─────────────────────────────────────────────────────────────────────

record Node where
  constructor MkNode
  name            : String
  extractionLevel : Double
  valueRatio      : Double
  targetDefence   : Double

defaultNode : String -> Double -> Double -> Node
defaultNode name ext val = MkNode name ext val 1.0

isBabylon : Node -> Bool
isBabylon n = n.extractionLevel > n.valueRatio

isPredator : Node -> Bool
isPredator n = isBabylon n && n.targetDefence < 1.0
