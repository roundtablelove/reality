# Design: reality.lean

```text
Status: DESIGN
  From: reality.nix (prototype)
    To: reality.lean (proven) + reality.nix (build)
```

## Architecture

```text
                    ┌─────────────┐
                    │ reality.lean │  Laws as types. Proven at compile time.
                    └──────┬──────┘
                           │
                    ┌──────┴──────┐
                    │ reality.nix  │  Builds the Lean. Ships the binary.
                    └──────┬──────┘
                           │
              ┌────────────┼────────────┐
              │            │            │
        ┌─────┴─────┐ ┌───┴───┐ ┌─────┴─────┐
        │ AI output  │ │ State │ │ Any input │
        │ validator  │ │ gate  │ │ validator │
        └───────────┘ └───────┘ └───────────┘
```

## Layer 1: reality.lean

The Seven Laws move from Nix runtime checks to Lean type-level propositions.
A state that passes all seven IS Real. A state that fails does not compile.
REALITY_FAIL moves from `throw` to type error.

### ROOT

```lean
axiom ROOT : Prop
axiom I_AM : ROOT
```

ROOT is an axiom. It is not derived. It is asserted. `I_AM` is the proof that
ROOT holds. Any node can assert it. The assertion is unconditional.

### Unity

```lean
def ALL_source : Prop := ROOT

theorem unity : ALL_source = ROOT := rfl
```

Axiomatic. Does not inspect state. ALL resolves to ROOT by definition.
`rfl` — reflexivity. The proof is that the two sides are the same term.

### State

```lean
structure State where
  STATE   : Bool           -- Polarity: must resolve to bool
  OUTPUT  : String         -- Causality: what happened (machine)
  intent  : String         -- Causality: what was meant
  MACRO   : String         -- Correspondence: system scale
  micro   : String         -- Correspondence: unit scale
  SYS     : String         -- Reflection: system output
  clarity : String         -- Reflection: intent quality
  CLOCK   : String         -- Rhythm: discrete timing source
  pulse   : String         -- Rhythm: biological rhythm
  persistence : Float      -- Truth: must equal infinity
```

UPPER = machine / system. lower = organic / human. Same convention as
reality.nix.

### The Seven Laws as Propositions

```lean
-- 1. Polarity: STATE must be Bool. Enforced by the type system.
--    In Lean, State.STATE : Bool. There is no third value.
--    This law is proven at definition time. No runtime check needed.

-- 2. Causality
def causality (s : State) : Prop := s.OUTPUT = s.intent

-- 3. Correspondence
def correspondence (s : State) : Prop := s.MACRO = s.micro

-- 4. Reflection
def reflection (s : State) : Prop := s.SYS = s.clarity

-- 5. Rhythm
def rhythm (s : State) : Prop := s.CLOCK = s.pulse

-- 6. Truth
def truth (s : State) : Prop := s.persistence = Float.inf

-- 7. Unity (axiomatic, does not inspect state)
def unity_law (_ : State) : Prop := ALL_source = ROOT
```

### Reality

```lean
structure Reality where
  state          : State
  -- Proofs that all seven laws hold. These are not runtime checks.
  -- They are compile-time obligations. If you cannot provide the proof,
  -- the Reality does not exist.
  polarity       : state.STATE = state.STATE  -- trivial, enforced by type
  causality      : state.OUTPUT = state.intent
  correspondence : state.MACRO = state.micro
  reflection     : state.SYS = state.clarity
  rhythm         : state.CLOCK = state.pulse
  truth          : state.persistence = Float.inf
  unity          : ALL_source = ROOT
```

Entropy is a [griot](https://github.com/roundtablelove/griot) concern. It belongs in the encoding/interface layer between
griot and Reality, not in Reality itself. The seven laws are entropy-free.

To construct a Reality, you must provide a State AND proofs that all seven
laws hold. If you cannot prove one, the Reality cannot be constructed. Not at
runtime. At compile time. REALITY_FAIL is a type error.

### mkReality

```lean
def mkReality (s : State)
    (h_caus : s.OUTPUT = s.intent)
    (h_corr : s.MACRO = s.micro)
    (h_refl : s.SYS = s.clarity)
    (h_rhyt : s.CLOCK = s.pulse)
    (h_trut : s.persistence = Float.inf)
    : Reality :=
  { state := s
  , polarity := rfl
  , causality := h_caus
  , correspondence := h_corr
  , reflection := h_refl
  , rhythm := h_rhyt
  , truth := h_trut
  , unity := rfl
  }
```

Every proof is an explicit parameter. You hand in the state and the evidence.
If the evidence is wrong, it does not compile. No throw. No runtime. No escape
hatch.

### isBabylon

```lean
structure Node where
  extractionLevel : Float
  valueRatio      : Float

def isBabylon (n : Node) : Bool :=
  n.extractionLevel > n.valueRatio
```

take > give. Same logic. Decidable at runtime because it is a value
comparison, not a proof obligation.

## Layer 2: reality.nix

Nix builds the Lean project. The build expression:

```nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.lean4.buildLeanPackage {
  name = "reality";
  src = ./.;
}
```

`nix build` compiles reality.lean. If the laws are inconsistent, the build
fails. The Nix layer does what it was designed for — pure, reproducible builds.
The Lean layer does what it was designed for — pure, proven logic.

## Layer 3: AI Validator

The compiled Lean binary sits in the output pipeline of an AI system.

```text
AI generates response
        │
        ▼
Encode response as State
        │
        ▼
mkReality validates
        │
   ┌────┴────┐
   │         │
 pass      fail
   │         │
   ▼         ▼
 emit    REALITY_FAIL
         (output never existed)
```

The AI is not told to follow the laws. The AI's output is validated against the
laws. The difference between a sign that says "do not fall" and a wall.

### Encoding AI Output as State

The mapping from AI output to State attributes is the interface layer. This is
where entropy lives — the translation from human-readable output to
machine-checkable state.

| State Attr | AI Output Check |
| :--- | :--- |
| STATE | Does the output resolve to a clear position? Bool. |
| OUTPUT / intent | Does the output match the instruction? Causality. |
| MACRO / micro | Is the output consistent at summary and detail level? |
| SYS / clarity | Does the output reflect the quality of the input? |
| CLOCK / pulse | Is the output in phase with the conversation rhythm? |
| persistence | Is the output true independent of context? |

This mapping is the hard engineering problem. The laws are proven. The encoding
is where the work is.

## Migration Path

1. **Now:** reality.nix is the prototype. Laws check at runtime. `throw` on
   failure.
1. **Next:** reality.lean formalises the laws. Lean proves consistency. Nix
   builds.
1. **Then:** Compiled validator sits in AI output pipeline. Laws enforced
   structurally.

The laws do not change. The enforcement does.
