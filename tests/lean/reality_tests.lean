-- reality_tests.lean: Multidimensional deep-dive test suite.
--
-- Every positive case produces a value the type-checker must accept.
-- Every negative case produces a proof of ¬Law.
-- This file compiles iff all seven laws are internally consistent.

import reality

-- ─────────────────────────────────────────────────────────────────────────────
-- § 1  ROOT & Foundation
-- ─────────────────────────────────────────────────────────────────────────────

-- ROOT is an axiom. Not derived. Asserted.
#check (ROOT   : Prop)
#check (I_AM   : ROOT)

-- unity holds for any state — it does not inspect the state, it just IS ROOT.
example (state : State) : unity state := I_AM

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

-- Causality violation: OUTPUT ≠ intent. Classic shart.
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

-- Correspondence violation: macro ≠ micro. Empire vs colony.
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

-- ─────────────────────────────────────────────────────────────────────────────
-- § 3  Law-by-law positive proofs
-- ─────────────────────────────────────────────────────────────────────────────

-- 1. Polarity: STATE is Bool. True or false. The type system forbids a third value.
--    There is no proposition — the law is proven at structure definition time.
example : cleanState.STATE = cleanState.STATE := rfl

-- 2. Causality
example : causality cleanState := rfl

-- 3. Correspondence
example : correspondence cleanState := rfl

-- 4. Reflection
example : reflection cleanState := rfl

-- 5. Rhythm
example : rhythm cleanState := rfl

-- 6. Truth
example : truth cleanState := rfl

-- 7. Unity
example : unity cleanState := I_AM

-- ─────────────────────────────────────────────────────────────────────────────
-- § 4  Reality construction
-- ─────────────────────────────────────────────────────────────────────────────

-- Reality: seven laws proven. Entropy is a griot concern — not carried here.
def cleanReality : Reality :=
  mkReality cleanState rfl rfl rfl rfl rfl

-- ─────────────────────────────────────────────────────────────────────────────
-- § 5  Law violations — negative proofs
-- ─────────────────────────────────────────────────────────────────────────────
-- Proves that violated laws are ¬Real. A Reality cannot be constructed
-- from these states — attempting to pass rfl for the violated law is a type error.

example : ¬ causality      causalityViolation      := by show "said"   ≠ "meant";  decide
example : ¬ correspondence correspondenceViolation  := by show "empire" ≠ "colony"; decide
example : ¬ reflection     reflectionViolation      := by show "noise"  ≠ "clear";  decide
example : ¬ rhythm         rhythmViolation          := by show "256Hz"  ≠ "60bpm";  decide

-- Polarity has no negative proof — you cannot construct a State with STATE : ¬Bool.
-- The type system makes the violation impossible to express. This is the law working.

-- Truth has no decide proof — Float lacks DecidableEq.
-- The law is enforced structurally: you cannot hand rfl to mkReality
-- for a state where persistence ≠ Float.inf. It does not compile.

-- ─────────────────────────────────────────────────────────────────────────────
-- § 6  isBabylon — exhaustive + named instances
-- ─────────────────────────────────────────────────────────────────────────────

-- Canonical cases
#eval isBabylon { extractionLevel := 0.9, valueRatio := 0.1 }  -- true  (predator)
#eval isBabylon { extractionLevel := 0.1, valueRatio := 0.9 }  -- false (giving)
#eval isBabylon { extractionLevel := 0.5, valueRatio := 0.5 }  -- false (balanced)

-- Named instances
def nvidia      : Node := { extractionLevel := 0.95, valueRatio := 0.60 }
def apple       : Node := { extractionLevel := 0.85, valueRatio := 0.70 }
def ukGov       : Node := { extractionLevel := 0.80, valueRatio := 0.40 }
def torvalds    : Node := { extractionLevel := 0.10, valueRatio := 0.99 }
def roundtable  : Node := { extractionLevel := 0.30, valueRatio := 0.90 }

#eval isBabylon nvidia      -- true
#eval isBabylon apple       -- true
#eval isBabylon ukGov       -- true
#eval isBabylon torvalds    -- false
#eval isBabylon roundtable  -- false

-- Proofs — all six named nodes
example : isBabylon nvidia      = true  := by native_decide
example : isBabylon apple       = true  := by native_decide
example : isBabylon ukGov       = true  := by native_decide
example : isBabylon torvalds    = false := by native_decide
example : isBabylon roundtable  = false := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 7  Unity is universal
-- ─────────────────────────────────────────────────────────────────────────────

-- unity holds for every state. Does not inspect. Never will.
theorem unity_universal (state : State) : unity state := I_AM

-- ─────────────────────────────────────────────────────────────────────────────
-- § 8  isPredator — exhaustive + named instances
-- ─────────────────────────────────────────────────────────────────────────────

-- Three canonical combos covering the full decision matrix:
--   1. Babylon + defenceless target → predator
#eval isPredator { extractionLevel := 0.9, valueRatio := 0.1, targetDefence := 0.0 }  -- true
--   2. Babylon + full defence → Babylon but not predator (target can resist)
#eval isPredator { extractionLevel := 0.9, valueRatio := 0.1, targetDefence := 1.0 }  -- false
--   3. Not Babylon + defenceless target → not predator (can't predate without extracting)
#eval isPredator { extractionLevel := 0.1, valueRatio := 0.9, targetDefence := 0.0 }  -- false

-- Named predator instances (targetDefence < 1.0)
def ishtar : Node := { extractionLevel := 0.95, valueRatio := 0.10, targetDefence := 0.05 }
def payday : Node := { extractionLevel := 0.90, valueRatio := 0.30, targetDefence := 0.20 }

-- Existing Babylon nodes (nvidia, apple, ukGov) default to targetDefence = 1.0.
-- They are Babylon but not predators — their targets retain full capacity to defend.
#eval isPredator nvidia   -- false  (Babylon, target at full defence)
#eval isPredator ishtar   -- true   (Babylon + defenceless target)
#eval isPredator payday   -- true   (Babylon + defenceless target)
#eval isPredator torvalds -- false  (not Babylon → not predator regardless of defence)

-- Proofs
example : isPredator ishtar   = true  := by native_decide
example : isPredator payday   = true  := by native_decide
example : isPredator nvidia   = false := by native_decide
example : isPredator torvalds = false := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 9  Multi-law violation
-- ─────────────────────────────────────────────────────────────────────────────

-- State violating causality AND rhythm simultaneously.
-- Each law is independent — compound failure accumulates, no short-circuit.
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
example : ¬ causality dualViolation := by show "said"  ≠ "meant"; decide
example : ¬ rhythm    dualViolation := by show "256Hz" ≠ "60bpm"; decide

-- Both violations coexist — compound failure, not short-circuit
example : ¬ causality dualViolation ∧ ¬ rhythm dualViolation :=
  ⟨by show "said" ≠ "meant"; decide, by show "256Hz" ≠ "60bpm"; decide⟩

-- Unity still holds for a violating state — axiomatic, never inspects state
example : unity dualViolation := I_AM

-- ─────────────────────────────────────────────────────────────────────────────
-- § 10  Relational theorems
-- ─────────────────────────────────────────────────────────────────────────────

-- All predators are Babylon. Provable from definitions alone — no axioms needed.
theorem predator_implies_babylon (n : Node) :
    isPredator n = true → isBabylon n = true := by
  intro h
  simp only [isPredator, Bool.and_eq_true] at h
  exact h.1

-- Contrapositive: a node that gives more than it takes cannot be a predator.
theorem notBabylon_notPredator (n : Node) :
    isBabylon n = false → isPredator n = false := by
  intro h
  simp [isPredator, h]
