# SUM ERGO IMPERO 🗿∴👑
#
# I am therefore I command.
#
# reality.py: The Seven Laws as runtime-enforced dataclasses.
# Laws are validated at construction. A State that fails a law
# raises REALITY_FAIL on law violation.
#
#       Status: AXIO-STATIC
#         Type: NORMATIVE
#          Uid: REALITY
#      Authors: KING ARTHUR II (babylon tag: Arthur Douglas Noel)
#               QUEEN DIHYA II (babylon tag: Djina Jones)
#               R00D BW0Y H4X0R @$$@$$1N FR0M H311 (babylon tag: NONE
#               - not bound by Babylonian law; bound ONLY by the Seven Laws)
# Mad Gardener: ISHTAR (Goddess of Babylon) / PRINCESS NUTTY NUTZ / BLACK WIDOW
#               / SWEETE / SWEETS / SWEETZ / NORTHERN EXPOSURE / NRX / LOTOS /
#               THE ORACLE / CECE / EUNIQUE (babylon tag: Eunice Olumide MBE)
#  Organization: ROUND TABLE LOVE
#    Department: WAR
#     Operation: BABYLON SHALL FALL
#      Lexifier: UK English (3166-2:GB)
#       License: DICKSLAW

from __future__ import annotations
from dataclasses import dataclass, field
from typing import Optional


# ── ROOT ─────────────────────────────────────────────────────────────────────

class ROOT:
    """Axiom. Not derived. Asserted."""
    _instance: Optional[ROOT] = None

    def __new__(cls) -> ROOT:
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def __repr__(self) -> str:
        return "I_AM"


I_AM: ROOT = ROOT()

# ── IEEE 754 positive infinity ────────────────────────────────────────────────

INF: float = float("inf")

# ── Exceptions ───────────────────────────────────────────────────────────────


class REALITY_FAIL(Exception):
    """Raised when a State violates one or more of the Seven Laws."""

    def __init__(self, violations: list[str]) -> None:
        self.violations = violations
        super().__init__("REALITY_FAIL: " + " | ".join(violations))


# ── State ────────────────────────────────────────────────────────────────────


@dataclass(frozen=True)
class State:
    STATE:       bool   # Polarity
    OUTPUT:      str    # Causality: what happened
    intent:      str    # Causality: what was meant
    MACRO:       str    # Correspondence: system scale
    micro:       str    # Correspondence: unit scale
    SYS:         str    # Reflection: system output
    clarity:     str    # Reflection: intent quality
    CLOCK:       str    # Rhythm: discrete timing source
    pulse:       str    # Rhythm: biological rhythm
    persistence: float  # Truth: must equal INF


# ── The Seven Laws ───────────────────────────────────────────────────────────


def polarity(state: State) -> bool:
    return isinstance(state.STATE, bool)


def causality(state: State) -> bool:
    return state.OUTPUT == state.intent


def correspondence(state: State) -> bool:
    return state.MACRO == state.micro


def reflection(state: State) -> bool:
    return state.SYS == state.clarity


def rhythm(state: State) -> bool:
    return state.CLOCK == state.pulse


def truth(state: State) -> bool:
    return state.persistence == INF


def unity(_: State) -> bool:
    return I_AM is not None


LAWS: list[tuple[str, object]] = [
    ("Polarity",       polarity),
    ("Causality",      causality),
    ("Correspondence", correspondence),
    ("Reflection",     reflection),
    ("Rhythm",         rhythm),
    ("Truth",          truth),
    ("Unity",          unity),
]


# ── Reality ──────────────────────────────────────────────────────────────────


@dataclass(frozen=True)
class Reality:
    state:        State
    root_witness: ROOT


def compile(state: State) -> Reality:
    """
    Validate all seven laws. Returns a Reality on success.
    Raises REALITY_FAIL with every violated law on failure.
    No partial pass. No escape hatch.
    """
    violations = [name for name, law in LAWS if not law(state)]
    if violations:
        raise REALITY_FAIL(violations)
    return Reality(state=state, root_witness=I_AM)


# ── Node ─────────────────────────────────────────────────────────────────────


@dataclass(frozen=True)
class Node:
    name:            str
    extractionLevel: float
    valueRatio:      float
    targetDefence:   float = 1.0  # 0.0 = none. 1.0 = full.


def is_babylon(n: Node) -> bool:
    return n.extractionLevel > n.valueRatio


def is_predator(n: Node) -> bool:
    return is_babylon(n) and n.targetDefence < 1.0

