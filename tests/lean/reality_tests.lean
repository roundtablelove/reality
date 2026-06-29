-- reality_tests.lean
--
-- Tests from multiple angles:
--   §  1  ROOT & foundation
--   §  2  State fixtures
--   §  3  Seven Laws — Bool pass/fail (mirrors Test.hs)
--   §  4  Law independence — each fixture breaks only its own law
--   §  5  Universal laws — polarity and unity hold for every state
--   §  6  Single-field mutation — exactly one law breaks per mutation
--   §  7  laws list structure
--   §  8  check — conjunction of all laws
--   §  9  compile — collect-all-failures
--   § 10  Reality — compile-time proof construction
--   § 11  Negative proofs — violated states are type errors
--   § 12  Float.inf properties
--   § 13  Node fixtures
--   § 14  Boundary values — isBabylon / isPredator edges
--   § 15  isBabylon
--   § 16  isPredator
--   § 17  Multi-law violation
--   § 18  Formal entailment — check ↔ all laws
--   § 19  Relational theorems

import reality

-- ─────────────────────────────────────────────────────────────────────────────
-- § 1  ROOT & foundation
-- ─────────────────────────────────────────────────────────────────────────────

#check (ROOT : Prop)
#check (I_AM : ROOT)
#check (root : ROOT)

example : root = I_AM := rfl

-- ─────────────────────────────────────────────────────────────────────────────
-- § 2  State fixtures
-- ─────────────────────────────────────────────────────────────────────────────

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

def causalityViolation : State where
  STATE := true;  OUTPUT := "said";   intent := "meant"
  MACRO := "pattern"; micro := "pattern"; SYS := "clear"; clarity := "clear"
  CLOCK := "tick"; pulse := "tick"; persistence := Float.inf

def correspondenceViolation : State where
  STATE := true;  OUTPUT := "signal"; intent := "signal"
  MACRO := "empire"; micro := "colony"; SYS := "clear"; clarity := "clear"
  CLOCK := "tick"; pulse := "tick"; persistence := Float.inf

def reflectionViolation : State where
  STATE := true;  OUTPUT := "signal"; intent := "signal"
  MACRO := "pattern"; micro := "pattern"; SYS := "noise"; clarity := "clear"
  CLOCK := "tick"; pulse := "tick"; persistence := Float.inf

def rhythmViolation : State where
  STATE := true;  OUTPUT := "signal"; intent := "signal"
  MACRO := "pattern"; micro := "pattern"; SYS := "clear"; clarity := "clear"
  CLOCK := "256Hz"; pulse := "60bpm"; persistence := Float.inf

def truthViolation : State where
  STATE := true;  OUTPUT := "signal"; intent := "signal"
  MACRO := "pattern"; micro := "pattern"; SYS := "clear"; clarity := "clear"
  CLOCK := "tick"; pulse := "tick"; persistence := 1.0

-- ─────────────────────────────────────────────────────────────────────────────
-- § 3  Seven Laws — Bool pass/fail  (mirrors Test.hs exactly)
-- ─────────────────────────────────────────────────────────────────────────────

example : polarity       cleanState             = true  := rfl
example : causality      cleanState             = true  := by native_decide
example : correspondence cleanState             = true  := by native_decide
example : reflection     cleanState             = true  := by native_decide
example : rhythm         cleanState             = true  := by native_decide
example : truth          cleanState             = true  := by native_decide
example : unity          cleanState             = true  := rfl

example : causality      causalityViolation     = false := by native_decide
example : correspondence correspondenceViolation = false := by native_decide
example : reflection     reflectionViolation    = false := by native_decide
example : rhythm         rhythmViolation        = false := by native_decide
example : truth          truthViolation         = false := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 4  Law independence — each fixture breaks only its own law
-- ─────────────────────────────────────────────────────────────────────────────

-- causalityViolation: only Causality fails
example : polarity       causalityViolation = true  := rfl
example : causality      causalityViolation = false := by native_decide
example : correspondence causalityViolation = true  := by native_decide
example : reflection     causalityViolation = true  := by native_decide
example : rhythm         causalityViolation = true  := by native_decide
example : truth          causalityViolation = true  := by native_decide
example : unity          causalityViolation = true  := rfl

-- correspondenceViolation: only Correspondence fails
example : causality      correspondenceViolation = true  := by native_decide
example : correspondence correspondenceViolation = false := by native_decide
example : reflection     correspondenceViolation = true  := by native_decide
example : rhythm         correspondenceViolation = true  := by native_decide
example : truth          correspondenceViolation = true  := by native_decide

-- reflectionViolation: only Reflection fails
example : causality      reflectionViolation = true  := by native_decide
example : correspondence reflectionViolation = true  := by native_decide
example : reflection     reflectionViolation = false := by native_decide
example : rhythm         reflectionViolation = true  := by native_decide
example : truth          reflectionViolation = true  := by native_decide

-- rhythmViolation: only Rhythm fails
example : causality      rhythmViolation = true  := by native_decide
example : correspondence rhythmViolation = true  := by native_decide
example : reflection     rhythmViolation = true  := by native_decide
example : rhythm         rhythmViolation = false := by native_decide
example : truth          rhythmViolation = true  := by native_decide

-- truthViolation: only Truth fails
example : causality      truthViolation = true  := by native_decide
example : correspondence truthViolation = true  := by native_decide
example : reflection     truthViolation = true  := by native_decide
example : rhythm         truthViolation = true  := by native_decide
example : truth          truthViolation = false := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 5  Universal laws
-- ─────────────────────────────────────────────────────────────────────────────

-- Polarity: Bool is Bool. There is no third value. Always true by construction.
theorem polarity_universal (s : State) : polarity s = true := rfl

-- Unity: ROOT is axiomatic. Does not inspect state. Never fails.
theorem unity_universal (s : State) : unity s = true := rfl

-- ─────────────────────────────────────────────────────────────────────────────
-- § 6  Single-field mutation — exactly one law breaks per mutation
-- ─────────────────────────────────────────────────────────────────────────────

-- Mutating OUTPUT breaks only Causality
example : causality      { cleanState with OUTPUT := "noise" } = false := by native_decide
example : correspondence { cleanState with OUTPUT := "noise" } = true  := by native_decide
example : reflection     { cleanState with OUTPUT := "noise" } = true  := by native_decide
example : rhythm         { cleanState with OUTPUT := "noise" } = true  := by native_decide
example : truth          { cleanState with OUTPUT := "noise" } = true  := by native_decide

-- Mutating MACRO breaks only Correspondence
example : causality      { cleanState with MACRO := "chaos" } = true  := by native_decide
example : correspondence { cleanState with MACRO := "chaos" } = false := by native_decide
example : reflection     { cleanState with MACRO := "chaos" } = true  := by native_decide
example : rhythm         { cleanState with MACRO := "chaos" } = true  := by native_decide
example : truth          { cleanState with MACRO := "chaos" } = true  := by native_decide

-- Mutating SYS breaks only Reflection
example : causality      { cleanState with SYS := "garbage" } = true  := by native_decide
example : correspondence { cleanState with SYS := "garbage" } = true  := by native_decide
example : reflection     { cleanState with SYS := "garbage" } = false := by native_decide
example : rhythm         { cleanState with SYS := "garbage" } = true  := by native_decide
example : truth          { cleanState with SYS := "garbage" } = true  := by native_decide

-- Mutating CLOCK breaks only Rhythm
example : causality      { cleanState with CLOCK := "off" } = true  := by native_decide
example : correspondence { cleanState with CLOCK := "off" } = true  := by native_decide
example : reflection     { cleanState with CLOCK := "off" } = true  := by native_decide
example : rhythm         { cleanState with CLOCK := "off" } = false := by native_decide
example : truth          { cleanState with CLOCK := "off" } = true  := by native_decide

-- Mutating persistence breaks only Truth
example : causality      { cleanState with persistence := 42.0 } = true  := by native_decide
example : correspondence { cleanState with persistence := 42.0 } = true  := by native_decide
example : reflection     { cleanState with persistence := 42.0 } = true  := by native_decide
example : rhythm         { cleanState with persistence := 42.0 } = true  := by native_decide
example : truth          { cleanState with persistence := 42.0 } = false := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 7  laws list
-- ─────────────────────────────────────────────────────────────────────────────

example : laws.length = 7 := by native_decide

example : laws.map Prod.fst =
    ["Polarity", "Causality", "Correspondence", "Reflection", "Rhythm", "Truth", "Unity"] :=
  by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 8  check
-- ─────────────────────────────────────────────────────────────────────────────

example : check cleanState              = true  := by native_decide
example : check causalityViolation      = false := by native_decide
example : check correspondenceViolation = false := by native_decide
example : check reflectionViolation     = false := by native_decide
example : check rhythmViolation         = false := by native_decide
example : check truthViolation          = false := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 9  compile — collect-all-failures
-- ─────────────────────────────────────────────────────────────────────────────

-- Valid state → .ok
#eval compile cleanState               -- .ok { ... }

-- Single violation → .error ["<Law>"]
#eval compile causalityViolation       -- .error ["Causality"]
#eval compile correspondenceViolation  -- .error ["Correspondence"]
#eval compile reflectionViolation      -- .error ["Reflection"]
#eval compile rhythmViolation          -- .error ["Rhythm"]
#eval compile truthViolation           -- .error ["Truth"]

-- Dual violation: collects both, in laws-list order
def dualViolation : State where
  STATE := true;  OUTPUT := "said"; intent := "meant"
  MACRO := "pattern"; micro := "pattern"; SYS := "clear"; clarity := "clear"
  CLOCK := "256Hz"; pulse := "60bpm"; persistence := Float.inf

#eval compile dualViolation  -- .error ["Causality", "Rhythm"]

-- Quad violation: all four collected, no short-circuit
def quadViolation : State where
  STATE := true;  OUTPUT := "noise"; intent := "signal"
  MACRO := "pattern"; micro := "pattern"; SYS := "noise"; clarity := "clear"
  CLOCK := "off"; pulse := "tick"; persistence := 1.0

#eval compile quadViolation  -- .error ["Causality", "Reflection", "Rhythm", "Truth"]

-- ─────────────────────────────────────────────────────────────────────────────
-- § 10  Reality — compile-time proof construction
-- ─────────────────────────────────────────────────────────────────────────────

def cleanReality : Reality :=
  mkReality cleanState rfl rfl rfl rfl rfl

-- The state inside cleanReality IS cleanState — no copy, no coercion
example : cleanReality.state = cleanState := rfl

-- Proof terms are definitionally rfl for equal strings
example : cleanReality.hCausality      = rfl := rfl
example : cleanReality.hCorrespondence = rfl := rfl
example : cleanReality.hReflection     = rfl := rfl
example : cleanReality.hRhythm         = rfl := rfl

-- Unity witness is I_AM — the axiom itself, carried in the structure
example : cleanReality.hUnity = I_AM := rfl

-- ─────────────────────────────────────────────────────────────────────────────
-- § 11  Negative proofs — violated states cannot be Real
-- ─────────────────────────────────────────────────────────────────────────────
--
-- These are TYPE ERRORS, not runtime failures. Uncomment to confirm:
--
--   def bad : Reality := mkReality causalityViolation rfl rfl rfl rfl rfl
--   -- error: type mismatch
--   --   "said" = "meant"   expected
--   --   "said" = "said"    got (rfl)
--
--   def bad2 : Reality := mkReality correspondenceViolation rfl rfl rfl rfl rfl
--   -- error: "empire" ≠ "colony"

-- Prop-level inequality witnesses (decidable for String):
example : ¬ (causalityViolation.OUTPUT      = causalityViolation.intent)        := by decide
example : ¬ (correspondenceViolation.MACRO  = correspondenceViolation.micro)     := by decide
example : ¬ (reflectionViolation.SYS        = reflectionViolation.clarity)       := by decide
example : ¬ (rhythmViolation.CLOCK          = rhythmViolation.pulse)             := by decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 12  Float.inf properties
-- ─────────────────────────────────────────────────────────────────────────────

-- inf is greater than any tested finite value
example : (Float.inf > 0.0)       = true := by native_decide
example : (Float.inf > 1.0)       = true := by native_decide
example : (Float.inf > 999999.0)  = true := by native_decide

-- Only inf satisfies truth; every finite value fails
example : truth { cleanState with persistence := Float.inf } = true  := by native_decide
example : truth { cleanState with persistence := 0.0       } = false := by native_decide
example : truth { cleanState with persistence := 1.0       } = false := by native_decide
example : truth { cleanState with persistence := 999999.0  } = false := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 13  Node fixtures
-- ─────────────────────────────────────────────────────────────────────────────

def apple    : Node := { nodeName := "Apple",         extractionLevel := 0.95, valueRatio := 0.30 }
def ishtar   : Node := { nodeName := "Ishtar",        extractionLevel := 0.90, valueRatio := 0.10, targetDefence := 0.05 }
def ukGov    : Node := { nodeName := "UK Government", extractionLevel := 1.00, valueRatio := 0.20 }
def fair     : Node := { nodeName := "Fair Exchange", extractionLevel := 0.40, valueRatio := 0.60 }
def torvalds : Node := { nodeName := "Torvalds",      extractionLevel := 0.10, valueRatio := 0.99 }
def payday   : Node := { nodeName := "Payday Loan",   extractionLevel := 0.90, valueRatio := 0.30, targetDefence := 0.20 }
def nvidia   : Node := mkNode "NVIDIA" 0.95 0.60

-- mkNode sets nodeName and targetDefence = 1.0 (full defence)
example : nvidia.nodeName      = "NVIDIA" := rfl
example : nvidia.targetDefence = 1.0     := rfl

-- ─────────────────────────────────────────────────────────────────────────────
-- § 14  Boundary values
-- ─────────────────────────────────────────────────────────────────────────────

-- extractionLevel = valueRatio exactly → not Babylon (strict >)
def balanced : Node := { nodeName := "Balanced", extractionLevel := 0.5, valueRatio := 0.5 }
example : isBabylon balanced = false := by native_decide

-- One step above: extraction > value → Babylon
def slightlyOver : Node := { nodeName := "SlightlyOver", extractionLevel := 0.51, valueRatio := 0.50 }
example : isBabylon slightlyOver = true := by native_decide

-- targetDefence = 1.0 exactly → not predator (strict <)
example : isPredator apple = false := by native_decide   -- apple.targetDefence = 1.0

-- targetDefence = 0.99 → predator if Babylon
def highDefence : Node := { nodeName := "HighDefence", extractionLevel := 0.9, valueRatio := 0.1, targetDefence := 0.99 }
example : isPredator highDefence = true := by native_decide

-- Not Babylon + zero defence → still not predator
def giver : Node := { nodeName := "Giver", extractionLevel := 0.1, valueRatio := 0.9, targetDefence := 0.0 }
example : isBabylon  giver = false := by native_decide
example : isPredator giver = false := by native_decide

-- Maximum extraction (1.0) + minimum return (0.0) → Babylon
def maxExtract : Node := { nodeName := "MaxExtract", extractionLevel := 1.0, valueRatio := 0.0 }
example : isBabylon maxExtract = true := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 15  isBabylon
-- ─────────────────────────────────────────────────────────────────────────────

example : isBabylon apple    = true  := by native_decide
example : isBabylon ishtar   = true  := by native_decide
example : isBabylon ukGov    = true  := by native_decide
example : isBabylon fair     = false := by native_decide
example : isBabylon torvalds = false := by native_decide
example : isBabylon nvidia   = true  := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 16  isPredator
-- ─────────────────────────────────────────────────────────────────────────────

-- Babylon + defenceless target → predator
example : isPredator ishtar = true  := by native_decide
example : isPredator payday = true  := by native_decide

-- Babylon + full defence → not predator (target can resist)
example : isPredator apple   = false := by native_decide
example : isPredator ukGov   = false := by native_decide
example : isPredator nvidia  = false := by native_decide

-- Not Babylon → not predator regardless of defence
example : isPredator fair     = false := by native_decide
example : isPredator torvalds = false := by native_decide

-- ─────────────────────────────────────────────────────────────────────────────
-- § 17  Multi-law violation
-- ─────────────────────────────────────────────────────────────────────────────

-- Each violation in dualViolation holds independently
example : causality dualViolation = false := by native_decide
example : rhythm    dualViolation = false := by native_decide

-- Laws that were not violated still hold
example : correspondence dualViolation = true := by native_decide
example : reflection     dualViolation = true := by native_decide
example : truth          dualViolation = true := by native_decide

-- Unity holds regardless — axiomatic
example : unity dualViolation = true := rfl
example : unity quadViolation = true := rfl

-- ─────────────────────────────────────────────────────────────────────────────
-- § 18  Formal entailment — check ↔ all laws
-- ─────────────────────────────────────────────────────────────────────────────

-- check is definitionally the conjunction of all laws.
-- Unfold check and laws, simplify polarity/unity (always true), then the
-- remaining Bool && chain decomposes into individual law equalities.

private theorem unfold_check (s : State) :
    check s = (causality s && (correspondence s && (reflection s && (rhythm s && truth s)))) := by
  simp [check, laws, polarity, unity, Bool.and_true]

-- check = true implies each law individually.
theorem check_implies_causality (s : State) : check s = true → causality s = true := by
  rw [unfold_check]; intro h; exact (Bool.and_eq_true.mp h).1

theorem check_implies_correspondence (s : State) : check s = true → correspondence s = true := by
  rw [unfold_check]; intro h
  exact (Bool.and_eq_true.mp (Bool.and_eq_true.mp h).2).1

theorem check_implies_reflection (s : State) : check s = true → reflection s = true := by
  rw [unfold_check]; intro h
  exact (Bool.and_eq_true.mp (Bool.and_eq_true.mp (Bool.and_eq_true.mp h).2).2).1

theorem check_implies_rhythm (s : State) : check s = true → rhythm s = true := by
  rw [unfold_check]; intro h
  exact (Bool.and_eq_true.mp
    (Bool.and_eq_true.mp (Bool.and_eq_true.mp (Bool.and_eq_true.mp h).2).2).2).1

theorem check_implies_truth (s : State) : check s = true → truth s = true := by
  rw [unfold_check]; intro h
  exact (Bool.and_eq_true.mp
    (Bool.and_eq_true.mp (Bool.and_eq_true.mp (Bool.and_eq_true.mp h).2).2).2).2

-- All laws true → check true (converse).
theorem all_laws_imply_check (s : State)
    (hc  : causality      s = true)
    (hco : correspondence s = true)
    (hr  : reflection     s = true)
    (hry : rhythm         s = true)
    (ht  : truth          s = true)
    : check s = true := by
  rw [unfold_check]
  simp [hc, hco, hr, hry, ht]

-- ─────────────────────────────────────────────────────────────────────────────
-- § 19  Relational theorems
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
  intro h; simp [isPredator, h]

-- mkNode always produces targetDefence = 1.0, so never a predator.
theorem mkNode_notPredator (name : String) (ext val : Float) :
    isPredator (mkNode name ext val) = false := by
  simp only [isPredator, mkNode, isBabylon,
             show (1.0 : Float) < 1.0 = false from by native_decide, Bool.and_false]
