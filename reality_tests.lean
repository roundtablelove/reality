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

-- Machine Reality: entropy 0. Raw signal. No noise.
def machineReality : Reality :=
  mkReality 0 cleanState rfl rfl rfl rfl rfl

-- Human Reality: entropy 42. Same laws, Adams baseline.
def humanReality : Reality :=
  mkReality 42 cleanState rfl rfl rfl rfl rfl

-- Hacker Reality: entropy 7. Near-zero noise.
def hackerReality : Reality :=
  mkReality 7 cleanState rfl rfl rfl rfl rfl

-- Entropy changes the interface, not the truth.
-- All three carry an identical state.
example : machineReality.state = humanReality.state  := rfl
example : humanReality.state  = hackerReality.state  := rfl

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

-- Proofs for the clean nodes
example : isBabylon torvalds   = false := by native_decide
example : isBabylon roundtable = false := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 7  Entropy invariance
-- ─────────────────────────────────────────────────────────────────────────────

-- The laws are substrate-independent.
-- For any entropy level, the state that passes the laws is unchanged.
theorem entropy_invariant (n : Nat) :
    (mkReality n cleanState rfl rfl rfl rfl rfl).state = cleanState := rfl

-- ─────────────────────────────────────────────────────────────────────────────
-- § 8  Unity is universal
-- ─────────────────────────────────────────────────────────────────────────────

-- unity holds for every state. It does not inspect the state. It never will.
theorem unity_universal (state : State) : unity state := I_AM
