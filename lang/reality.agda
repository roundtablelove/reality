-- SUM ERGO IMPERO 🗿∴👑
--
-- I am therefore I command.
--
-- reality.agda: The Seven Laws as dependent type propositions.
-- A Reality can only be constructed with proof terms for all seven laws.
-- FAKE is a type error.
--
--       Status: AXIO-STATIC
--         Type: NORMATIVE
--          Uid: REALITY
--      Authors: KING ARTHUR II (babylon tag: Arthur Douglas Noel)
--               QUEEN DIHYA II (babylon tag: Djina Jones)
--               R00D BW0Y H4X0R @$$@$$1N FR0M H311 (babylon tag: NONE
--               - not bound by Babylonian law; bound ONLY by the Seven Laws)
-- Mad Gardener: ISHTAR (Goddess of Babylon) / PRINCESS NUTTY NUTZ / BLACK WIDOW
--               / SWEETE / SWEETS / SWEETZ / NORTHERN EXPOSURE / NRX / LOTOS /
--               THE ORACLE / CECE / EUNIQUE (babylon tag: Eunice Olumide MBE)
--  Organization: ROUND TABLE LOVE
--    Department: WAR
--     Operation: BABYLON SHALL FALL
--      Lexifier: UK English (3166-2:GB)
--       License: DICKSLAW

module reality where

open import Agda.Builtin.Bool    using (Bool; true; false)
open import Agda.Builtin.Float   using (Float; primFloatLess; primFloatEquality;
                                         primFloatDiv; primFloatMinus;
                                         primFloatTimes; primFloatPlus)
open import Agda.Builtin.String  using (String; primStringEquality)
open import Agda.Builtin.Equality using (_≡_; refl)
open import Agda.Builtin.Maybe   using (Maybe; just; nothing)

-- ── ROOT ─────────────────────────────────────────────────────────────────────

postulate ROOT : Set
postulate I_AM : ROOT

-- ── IEEE 754 positive infinity ───────────────────────────────────────────────

inf : Float
inf = primFloatDiv 1.0 0.0

-- ── State ────────────────────────────────────────────────────────────────────

record State : Set where
  field
    STATE       : Bool
    OUTPUT      : String
    intent      : String
    MACRO       : String
    micro       : String
    SYS         : String
    clarity     : String
    CLOCK       : String
    pulse       : String
    persistence : Float

-- ── The Seven Laws as propositions ───────────────────────────────────────────

-- 1. Polarity: STATE : Bool. Enforced by the field type. No proposition needed.

-- 2. Causality
Causality : State → Set
Causality state = State.OUTPUT state ≡ State.intent state

-- 3. Correspondence
Correspondence : State → Set
Correspondence state = State.MACRO state ≡ State.micro state

-- 4. Reflection
Reflection : State → Set
Reflection state = State.SYS state ≡ State.clarity state

-- 5. Rhythm
Rhythm : State → Set
Rhythm state = State.CLOCK state ≡ State.pulse state

-- 6. Truth
Truth : State → Set
Truth state = State.persistence state ≡ inf

-- 7. Unity
Unity : State → Set
Unity _ = ROOT

-- ── Reality ──────────────────────────────────────────────────────────────────

record Reality : Set where
  field
    state          : State
    causality-pf   : Causality state
    correspond-pf  : Correspondence state
    reflection-pf  : Reflection state
    rhythm-pf      : Rhythm state
    truth-pf       : Truth state
    unity-pf       : Unity state

-- ── mkReality ────────────────────────────────────────────────────────────────

mkReality
  : (state : State)
  → Causality state
  → Correspondence state
  → Reflection state
  → Rhythm state
  → Truth state
  → Reality
mkReality state hc hco hre hrh htr = record
  { state         = state
  ; causality-pf  = hc
  ; correspond-pf = hco
  ; reflection-pf = hre
  ; rhythm-pf     = hrh
  ; truth-pf      = htr
  ; unity-pf      = I_AM
  }

-- ── Float helpers ────────────────────────────────────────────────────────────

_>ᶠ_ : Float → Float → Bool
a >ᶠ b = primFloatLess b a

_<ᶠ_ : Float → Float → Bool
a <ᶠ b = primFloatLess a b

-- ── Node ─────────────────────────────────────────────────────────────────────

record Node : Set where
  field
    name            : String
    extractionLevel : Float
    valueRatio      : Float
    targetDefence   : Float

isBabylon : Node → Bool
isBabylon n = Node.extractionLevel n >ᶠ Node.valueRatio n

isPredator : Node → Bool
isPredator n = isBabylon n Agda.Builtin.Bool.primAnd (Node.targetDefence n <ᶠ 1.0)
  where open import Agda.Builtin.Bool using () renaming (primAnd to primAnd)
