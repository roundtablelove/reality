-- reality_tests.lean
--
-- Mirrors tests/Test.hs exactly, then goes further with compile-time proofs
-- that Haskell cannot express.
-- Positive cases: prove law = true.  Negative: prove law = false.
-- This file compiles iff all seven laws are internally consistent.

import reality

-- ─────────────────────────────────────────────────────────────────────────────
-- § 1  ROOT & foundation
-- ─────────────────────────────────────────────────────────────────────────────

#check (ROOT   : Prop)
#check (I_AM   : ROOT)
#check (root   : ROOT)

-- ─────────────────────────────────────────────────────────────────────────────
-- § 2  Fixtures
-- ─────────────────────────────────────────────────────────────────────────────

-- Clean: all seven laws satisfied.
def cleanState : State where
  STATE       := true
  OUTPUT      := "signal"
  intent      := "signal"
  MACRO       := "pattern"
  micro       := "pattern"
  SYS         := "clear"
  clarity     := "clear"
  CLOCK       := "tick"
  pulse       := "tick"
  persistence := Float.inf

-- Causality violation: OUTPUT ≠ intent.
def causalityViolation : State where
  STATE       := true
  OUTPUT      := "said"
  intent      := "meant"
  MACRO       := "pattern"
  micro       := "pattern"
  SYS         := "clear"
  clarity     := "clear"
  CLOCK       := "tick"
  pulse       := "tick"
  persistence := Float.inf

-- Correspondence violation: macro ≠ micro.
def correspondenceViolation : State where
  STATE       := true
  OUTPUT      := "signal"
  intent      := "signal"
  MACRO       := "empire"
  micro       := "colony"
  SYS         := "clear"
  clarity     := "clear"
  CLOCK       := "tick"
  pulse       := "tick"
  persistence := Float.inf

-- Reflection violation: garbage in.
def reflectionViolation : State where
  STATE       := true
  OUTPUT      := "signal"
  intent      := "signal"
  MACRO       := "pattern"
  micro       := "pattern"
  SYS         := "noise"
  clarity     := "clear"
  CLOCK       := "tick"
  pulse       := "tick"
  persistence := Float.inf

-- Rhythm violation: clock and pulse out of phase.
def rhythmViolation : State where
  STATE       := true
  OUTPUT      := "signal"
  intent      := "signal"
  MACRO       := "pattern"
  micro       := "pattern"
  SYS         := "clear"
  clarity     := "clear"
  CLOCK       := "256Hz"
  pulse       := "60bpm"
  persistence := Float.inf

-- Truth violation: finite persistence.
def truthViolation : State where
  STATE       := true
  OUTPUT      := "signal"
  intent      := "signal"
  MACRO       := "pattern"
  micro       := "pattern"
  SYS         := "clear"
  clarity     := "clear"
  CLOCK       := "tick"
  pulse       := "tick"
  persistence := 1.0

-- ─────────────────────────────────────────────────────────────────────────────
-- § 3  Seven Laws — Bool functions (mirrors Test.hs exactly)
-- ─────────────────────────────────────────────────────────────────────────────

-- Polarity: always true. Does not inspect state.
example : polarity cleanState             = true  := rfl
example : polarity causalityViolation     = true  := rfl
example (s : State) : polarity s          = true  := rfl

-- Causality
example : causality cleanState            = true  := by native_decide
example : causality causalityViolation    = false := by native_decide

-- Correspondence
example : correspondence cleanState           = true  := by native_decide
example : correspondence correspondenceViolation = false := by native_decide

-- Reflection
example : reflection cleanState           = true  := by native_decide
example : reflection reflectionViolation  = false := by native_decide

-- Rhythm
example : rhythm cleanState               = true  := by native_decide
example : rhythm rhythmViolation          = false := by native_decide

-- Truth
example : truth cleanState               = true  := by native_decide
example : truth truthViolation           = false := by native_decide

-- Unity: always true. Axiomatic.
example : unity cleanState               = true  := rfl
example (s : State) : unity s            = true  := rfl

-- ─────────────────────────────────────────────────────────────────────────────
-- § 4  laws list
-- ─────────────────────────────────────────────────────────────────────────────

example : laws.length = 7 := by native_decide

example : laws.map Prod.fst =
    ["Polarity", "Causality", "Correspondence", "Reflection", "Rhythm", "Truth", "Unity"] :=
  by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 5  check
-- ─────────────────────────────────────────────────────────────────────────────

example : check cleanState               = true  := by native_decide
example : check causalityViolation       = false := by native_decide
example : check correspondenceViolation  = false := by native_decide
example : check reflectionViolation      = false := by native_decide
example : check rhythmViolation          = false := by native_decide
example : check truthViolation           = false := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 6  compile — runtime collect-all-failures
-- ─────────────────────────────────────────────────────────────────────────────

-- Valid state → .ok
#eval compile cleanState               -- .ok { STATE := true, OUTPUT := "signal", ... }

-- Single violation → .error with that law
#eval compile causalityViolation       -- .error ["Causality"]
#eval compile correspondenceViolation  -- .error ["Correspondence"]
#eval compile reflectionViolation      -- .error ["Reflection"]
#eval compile rhythmViolation          -- .error ["Rhythm"]
#eval compile truthViolation           -- .error ["Truth"]

-- Multi-violation: collects all, no short-circuit
def quadViolation : State where
  STATE       := true
  OUTPUT      := "noise"   -- Causality fail
  intent      := "signal"
  MACRO       := "pattern"
  micro       := "pattern"
  SYS         := "noise"   -- Reflection fail
  clarity     := "clear"
  CLOCK       := "off"     -- Rhythm fail
  pulse       := "tick"
  persistence := 1.0       -- Truth fail

#eval compile quadViolation  -- .error ["Causality", "Reflection", "Rhythm", "Truth"]

-- ─────────────────────────────────────────────────────────────────────────────
-- § 7  Reality — compile-time proof construction
-- ─────────────────────────────────────────────────────────────────────────────

-- cleanState satisfies all seven laws. Proofs handed to mkReality explicitly.
def cleanReality : Reality :=
  mkReality cleanState rfl rfl rfl rfl rfl

-- Unity holds for every Reality — axiomatic.
example : cleanReality.hUnity = I_AM := rfl

-- ─────────────────────────────────────────────────────────────────────────────
-- § 8  Negative proofs — violated states cannot be Real
-- ─────────────────────────────────────────────────────────────────────────────
--
-- Attempting to pass rfl for a violated law is a type error.
-- Uncomment to verify:
--
--   def badReality : Reality := mkReality causalityViolation rfl rfl rfl rfl rfl
--
-- Error: type mismatch — "said" ≠ "meant"

-- Decidable inequality proofs (Prop level):
example : ¬ (causalityViolation.OUTPUT = causalityViolation.intent)      := by decide
example : ¬ (correspondenceViolation.MACRO = correspondenceViolation.micro) := by decide
example : ¬ (reflectionViolation.SYS = reflectionViolation.clarity)      := by decide
example : ¬ (rhythmViolation.CLOCK = rhythmViolation.pulse)              := by decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 9  Node fixtures
-- ─────────────────────────────────────────────────────────────────────────────

def apple      : Node := { nodeName := "Apple",          extractionLevel := 0.95, valueRatio := 0.30 }
def ishtar     : Node := { nodeName := "Ishtar",         extractionLevel := 0.90, valueRatio := 0.10, targetDefence := 0.05 }
def ukGov      : Node := { nodeName := "UK Government",  extractionLevel := 1.00, valueRatio := 0.20 }
def fair       : Node := { nodeName := "Fair Exchange",  extractionLevel := 0.40, valueRatio := 0.60 }
def torvalds   : Node := { nodeName := "Torvalds",       extractionLevel := 0.10, valueRatio := 0.99 }
def payday     : Node := { nodeName := "Payday Loan",    extractionLevel := 0.90, valueRatio := 0.30, targetDefence := 0.20 }

-- mkNode helper
def nvidia : Node := mkNode "NVIDIA" 0.95 0.60
example : nvidia.nodeName = "NVIDIA" := rfl
example : nvidia.targetDefence = 1.0 := rfl

-- ─────────────────────────────────────────────────────────────────────────────
-- § 10  isBabylon
-- ─────────────────────────────────────────────────────────────────────────────

example : isBabylon apple    = true  := by native_decide
example : isBabylon ishtar   = true  := by native_decide
example : isBabylon ukGov    = true  := by native_decide
example : isBabylon fair     = false := by native_decide
example : isBabylon torvalds = false := by native_decide
example : isBabylon nvidia   = true  := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 11  isPredator
-- ─────────────────────────────────────────────────────────────────────────────

-- Babylon + defenceless target → predator
example : isPredator ishtar  = true  := by native_decide
example : isPredator payday  = true  := by native_decide

-- Babylon + full defence → not predator
example : isPredator apple   = false := by native_decide
example : isPredator ukGov   = false := by native_decide
example : isPredator nvidia  = false := by native_decide

-- Not Babylon + no defence → not predator (cannot predate without extracting)
example : isPredator fair    = false := by native_decide
example : isPredator torvalds = false := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 12  Multi-law violation
-- ─────────────────────────────────────────────────────────────────────────────

def dualViolation : State where
  STATE       := true
  OUTPUT      := "said"
  intent      := "meant"
  MACRO       := "pattern"
  micro       := "pattern"
  SYS         := "clear"
  clarity     := "clear"
  CLOCK       := "256Hz"
  pulse       := "60bpm"
  persistence := Float.inf

-- Each violation holds independently
example : causality dualViolation = false := by native_decide
example : rhythm    dualViolation = false := by native_decide

-- Unity still holds regardless — axiomatic, never inspects state
example : unity dualViolation = true := rfl

-- ─────────────────────────────────────────────────────────────────────────────
-- § 13  Relational theorems
-- ─────────────────────────────────────────────────────────────────────────────

-- All predators are Babylon.
theorem predator_implies_babylon (n : Node) :
    isPredator n = true → isBabylon n = true := by
  intro h
  simp only [isPredator, Bool.and_eq_true] at h
  exact h.1

-- Contrapositive: not Babylon → not predator.
theorem notBabylon_notPredator (n : Node) :
    isBabylon n = false → isPredator n = false := by
  intro h
  simp [isPredator, h]

-- Unity is universal — holds for every state without exception.
theorem unity_universal (s : State) : unity s = true := rfl
