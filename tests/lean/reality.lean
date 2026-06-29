-- SUM ERGO IMPERO 🗿∴👑
--
-- I am therefore I command.
--
-- reality.lean: The Seven Laws as Bool functions (mirroring Reality.hs)
-- and as compile-time Prop obligations (beyond what Haskell can express).
-- compile :: State -> Except (List String) State  — runtime, collects all failures.
-- mkReality requires explicit proof terms — FAKE is a type error, not a runtime crash.
--
--        Status: AXIO-STATIC
--          Type: NORMATIVE
--           Uid: REALITY
--       Authors: KING ARTHUR II / APEX KILLA (babylon tag: Arthur Douglas Noel)
--                QUEEN DIHYA II (babylon tag: Djina Jones)
--                R00D BW0Y H4X0R FR0M H311 / (babylon tag: NONE
--                - not bound by Babylonian law; bound ONLY by the Seven Laws)
--  Mad Gardener: ISHTAR (Goddess of Babylon) / PRINCESS NUTTY NUTZ / BLACK WIDOW
--               / SWEETE / SWEETS / SWEETZ / NORTHERN EXPOSURE / NRX / LOTOS /
--               THE ORACLE / CECE / EUNIQUE (babylon tag: Eunice Olumide MBE)
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

def root : ROOT := I_AM

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
  deriving Repr

-- ── The Seven Laws ───────────────────────────────────────────────────────────
--
-- Bool functions mirroring Reality.hs exactly.
-- Laws run all seven; compile collects all failures before returning.

-- 1. Polarity: STATE is Bool by construction. Always passes.
def polarity (_ : State) : Bool := true

-- 2. Causality: output must match intent.
def causality (s : State) : Bool := s.OUTPUT == s.intent

-- 3. Correspondence: macro must match micro.
def correspondence (s : State) : Bool := s.MACRO == s.micro

-- 4. Reflection: system output must match clarity of input.
def reflection (s : State) : Bool := s.SYS == s.clarity

-- 5. Rhythm: clock must match pulse.
def rhythm (s : State) : Bool := s.CLOCK == s.pulse

-- 6. Truth: persistence must equal infinity.
def truth (s : State) : Bool := s.persistence == Float.inf

-- 7. Unity: axiomatic. ROOT holds unconditionally.
def unity (_ : State) : Bool := true

def laws : List (String × (State → Bool)) :=
  [ ("Polarity",       polarity)
  , ("Causality",      causality)
  , ("Correspondence", correspondence)
  , ("Reflection",     reflection)
  , ("Rhythm",         rhythm)
  , ("Truth",          truth)
  , ("Unity",          unity)
  ]

-- ── Reality ──────────────────────────────────────────────────────────────────
--
-- Proof-carrying structure. Every law must be witnessed at construction time.
-- If one proof is missing, the Reality cannot be constructed — not at runtime,
-- at compile time. FAKE is a type error.

structure Reality where
  state           : State
  hPolarity       : state.STATE = state.STATE   -- trivial; enforced by type
  hCausality      : state.OUTPUT = state.intent
  hCorrespondence : state.MACRO  = state.micro
  hReflection     : state.SYS    = state.clarity
  hRhythm         : state.CLOCK  = state.pulse
  hTruth          : state.persistence = Float.inf
  hUnity          : ROOT

-- ── mkReality ────────────────────────────────────────────────────────────────
--
-- Every proof is an explicit parameter. Hand in the state and the evidence.
-- Wrong evidence does not compile. No throw. No runtime. No escape hatch.

def mkReality
    (state  : State)
    (h_caus : state.OUTPUT = state.intent)
    (h_corr : state.MACRO  = state.micro)
    (h_refl : state.SYS    = state.clarity)
    (h_rhyt : state.CLOCK  = state.pulse)
    (h_trut : state.persistence = Float.inf)
    : Reality :=
  { state           := state
  , hPolarity       := rfl
  , hCausality      := h_caus
  , hCorrespondence := h_corr
  , hReflection     := h_refl
  , hRhythm         := h_rhyt
  , hTruth          := h_trut
  , hUnity          := I_AM
  }

-- ── check ────────────────────────────────────────────────────────────────────
--
-- Runtime Bool: passes iff all seven laws hold. Mirrors Haskell check.

def check (s : State) : Bool :=
  laws.all (fun (_, f) => f s)

-- ── compile ──────────────────────────────────────────────────────────────────
--
-- Runtime collect-all-failures. Mirrors Haskell compile.
-- Returns .ok state or .error with every failing law name — no short-circuit.
-- Note: success returns State, not Reality. Runtime cannot construct proof terms.
-- Use mkReality for compile-time Reality construction.

def compile (s : State) : Except (List String) State :=
  let failures := laws.filterMap (fun (n, f) => if f s then none else some n)
  if failures.isEmpty then .ok s else .error failures

-- ── Node ─────────────────────────────────────────────────────────────────────

structure Node where
  nodeName        : String
  extractionLevel : Float
  valueRatio      : Float
  targetDefence   : Float := 1.0
  deriving Repr

def mkNode (name : String) (ext val : Float) : Node :=
  { nodeName := name, extractionLevel := ext, valueRatio := val }

-- ── isBabylon ────────────────────────────────────────────────────────────────
--
-- Take > Give. Decidable at runtime — a value comparison, not a proof.

def isBabylon (n : Node) : Bool :=
  n.extractionLevel > n.valueRatio

-- ── isPredator ───────────────────────────────────────────────────────────────
--
-- All predators are extractive. Not all extraction is predation.
-- The distinction is defence: the target's capacity to resist.

def isPredator (n : Node) : Bool :=
  isBabylon n && n.targetDefence < 1.0
