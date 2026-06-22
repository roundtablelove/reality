// SUM ERGO IMPERO 🗿∴👑
//
// I am therefore I command.
//
// reality.cpp: The Seven Laws in C++20.
// Laws are functions. compile() throws REALITY_FAIL on violation —
// all violations collected before throw, no short-circuit.
// REALITY_FAIL is a type error at the boundary. No escape hatch.
//
//       Status: AXIO-STATIC
//         Type: NORMATIVE
//          Uid: REALITY
//      Authors: KING ARTHUR II
//               QUEEN DIHYA II
//               R00D BW0Y H4X0R FR0M H311
//  Organization: ROUND TABLE LOVE
//    Department: WAR
//     Operation: BABYLON SHALL FALL
//      Lexifier: UK English (3166-2:GB)
//       License: DICKSLAW

#include <functional>
#include <limits>
#include <stdexcept>
#include <string>
#include <vector>

// ── ROOT ──────────────────────────────────────────────────────────────────────

struct ROOT {};
inline constexpr ROOT I_AM{};

// ── IEEE 754 positive infinity ────────────────────────────────────────────────

inline constexpr double INF = std::numeric_limits<double>::infinity();

// ── State ─────────────────────────────────────────────────────────────────────

struct State {
    bool        STATE;
    std::string OUTPUT;
    std::string intent;
    std::string MACRO;
    std::string micro;
    std::string SYS;
    std::string clarity;
    std::string CLOCK;
    std::string pulse;
    double      persistence;
};

// ── The Seven Laws ────────────────────────────────────────────────────────────

// 1. Polarity — bool by construction. Always passes.
inline bool polarity(const State&) { return true; }

// 2. Causality
inline bool causality(const State& state) { return state.OUTPUT == state.intent; }

// 3. Correspondence
inline bool correspondence(const State& state) { return state.MACRO == state.micro; }

// 4. Reflection
inline bool reflection(const State& state) { return state.SYS == state.clarity; }

// 5. Rhythm
inline bool rhythm(const State& state) { return state.CLOCK == state.pulse; }

// 6. Truth
inline bool truth(const State& state) { return state.persistence == INF; }

// 7. Unity
inline bool unity(const State&) { return true; }

using Law = std::pair<std::string, std::function<bool(const State&)>>;

inline const std::vector<Law> LAWS = {
    { "Polarity",       polarity       },
    { "Causality",      causality      },
    { "Correspondence", correspondence },
    { "Reflection",     reflection     },
    { "Rhythm",         rhythm         },
    { "Truth",          truth          },
    { "Unity",          unity          },
};

// ── Reality ───────────────────────────────────────────────────────────────────

struct Reality {
    State state;
    ROOT  root_witness;
};

// ── REALITY_FAIL ──────────────────────────────────────────────────────────────────────

class REALITY_FAIL : public std::runtime_error {
public:
    std::vector<std::string> violations;

    explicit REALITY_FAIL(std::vector<std::string> v)
        : std::runtime_error(make_msg(v))
        , violations(std::move(v))
    {}

private:
    static std::string make_msg(const std::vector<std::string>& v) {
        std::string msg = "REALITY_FAIL:";
        for (const auto& name : v) msg += " | " + name;
        return msg;
    }
};

// ── compile ───────────────────────────────────────────────────────────────────

Reality compile(State state) {
    std::vector<std::string> violations;
    for (const auto& [name, fn] : LAWS)
        if (!fn(state)) violations.push_back(name);
    if (!violations.empty())
        throw REALITY_FAIL(std::move(violations));
    return { std::move(state), I_AM };
}

// ── Node ──────────────────────────────────────────────────────────────────────

struct Node {
    std::string name;
    double      extractionLevel;
    double      valueRatio;
    double      targetDefence = 1.0;  // 0.0 = none. 1.0 = full.
};

inline bool is_babylon(const Node& n) {
    return n.extractionLevel > n.valueRatio;
}

inline bool is_predator(const Node& n) {
    return is_babylon(n) && n.targetDefence < 1.0;
}
