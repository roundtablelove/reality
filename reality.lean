-- SUM ERGO IMPERO 🗿∴👑
--
-- I am therefore I command.
--
-- reality.lean: The Seven Laws as type-level propositions.
-- A state that passes all seven IS Real. A state that fails
-- does not compile. FAKE is a type error.
--
--        Status: AXIO-STATIC
--          Type: NORMATIVE
--           Uid: REALITY
--       Authors: KING ARTHUR II (babylon tag: Arthur Douglas Noel)
--                QUEEN DIHYA II (babylon tag: Djina Jones)
--                R00D BW0Y H4X0R FR0M H311
-- Mad Gardener: Ishtar (goddess of Babyon) a.k.a. Princess Nutty Nutz / SweetE /
--               Northern Exposure / NRX / LOTOS / Oracle / Black Widow (babylon
--               tag: Eunice Olumide MBE)
--  Organization: ROUND TABLE LOVE
--    Department: WAR
--     Operation: BABYLON SHALL FALL
--      Lexifier: UK English (3166-2:GB)
--       License: [DICKSLAW](https://github.com/roundtablelove/dickslaw)

-- ── ROOT ─────────────────────────────────────────────────────────────────────
--
-- ROOT is an axiom. Not derived. Asserted.
-- I_AM is the proof that ROOT holds.
-- Any node can assert it. The assertion is unconditional.

axiom ROOT : Prop
axiom I_AM : ROOT

-- ── IEEE 754 positive infinity ───────────────────────────────────────────────
--
-- Truth persists at infinity. 1.0 / 0.0 is +∞ under IEEE 754.

abbrev Float.inf : Float := 1.0 / 0.0

-- ── State ────────────────────────────────────────────────────────────────────
--
-- A proposed state. UPPER = machine / system. lower = organic / human.
-- Polarity is enforced by the type: STATE : Bool. No third value.

structure State where
  STATE       : Bool    -- Polarity: must resolve to bool. Type axiom.
  OUTPUT      : String  -- Causality: what happened (machine).
  intent      : String  -- Causality: what was meant (ROOT).
  MACRO       : String  -- Correspondence: pattern at system scale.
  micro       : String  -- Correspondence: pattern at unit scale.
  SYS         : String  -- Reflection: system output.
  clarity     : String  -- Reflection: intent quality.
  CLOCK       : String  -- Rhythm: discrete timing source.
  pulse       : String  -- Rhythm: biological rhythm.
  persistence : Float   -- Truth: must equal infinity.

-- ── The Seven Laws as Propositions ───────────────────────────────────────────
--
-- These are compile-time obligations, not runtime checks.
-- A state that violates a law cannot be Real.

-- 1. Polarity: STATE : Bool. Proven at definition time. No proposition needed.

-- 2. Causality
def causality (state : State) : Prop := state.OUTPUT = state.intent

-- 3. Correspondence
def correspondence (state : State) : Prop := state.MACRO = state.micro

-- 4. Reflection
def reflection (state : State) : Prop := state.SYS = state.clarity

-- 5. Rhythm
def rhythm (state : State) : Prop := state.CLOCK = state.pulse

-- 6. Truth
def truth (state : State) : Prop := state.persistence = Float.inf

-- 7. Unity (axiomatic, does not inspect state)
def unity (_ : State) : Prop := ROOT

-- ── Reality ──────────────────────────────────────────────────────────────────
--
-- To construct a Reality you must provide a State AND proofs that all seven
-- laws hold. If one proof is missing the Reality cannot be constructed.
-- Not at runtime. At compile time. FAKE is a type error.

structure Reality where
  entropy        : Nat
  state          : State
  polarity       : state.STATE = state.STATE    -- trivial; enforced by type
  causality      : state.OUTPUT = state.intent
  correspondence : state.MACRO = state.micro
  reflection     : state.SYS = state.clarity
  rhythm         : state.CLOCK = state.pulse
  truth          : state.persistence = Float.inf
  unity          : ROOT

-- ── mkReality ────────────────────────────────────────────────────────────────
--
-- Every proof is an explicit parameter. Hand in the state and the evidence.
-- If the evidence is wrong it does not compile.
-- No throw. No runtime. No escape hatch.

def mkReality
    (entropy : Nat)
    (state   : State)
    (h_caus  : state.OUTPUT = state.intent)
    (h_corr  : state.MACRO  = state.micro)
    (h_refl  : state.SYS    = state.clarity)
    (h_rhyt  : state.CLOCK  = state.pulse)
    (h_trut  : state.persistence = Float.inf)
    : Reality :=
  { entropy        := entropy
  , state          := state
  , polarity       := rfl
  , causality      := h_caus
  , correspondence := h_corr
  , reflection     := h_refl
  , rhythm         := h_rhyt
  , truth          := h_trut
  , unity          := I_AM
  }

-- ── isBabylon ────────────────────────────────────────────────────────────────
--
-- take > give. Decidable at runtime — a value comparison, not a proof.

structure Node where
  extractionLevel : Float
  valueRatio      : Float
  targetDefence   : Float := 1.0  -- 0.0 = none (child, unconscious, restrained). 1.0 = full.

def isBabylon (n : Node) : Bool :=
  n.extractionLevel > n.valueRatio

-- ── isPredator ───────────────────────────────────────────────────────────────
--
-- All predators are extractive. Not all extraction is predation.
-- The distinction is defence: the target's capacity to resist.
-- A node that extracts from a target with full defence is Babylon.
-- A node that extracts from a target that cannot resist is a predator.

def isPredator (n : Node) : Bool :=
  isBabylon n && n.targetDefence < 1.0
