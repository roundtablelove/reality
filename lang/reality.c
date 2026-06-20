/* SUM ERGO IMPERO 🗿∴👑
 *
 * I am therefore I command.
 *
 * reality.c: The Seven Laws in C99.
 * Laws are functions. compile() returns a tagged result —
 * no exceptions, no longjmp, no escape hatch.
 * FAKE is a runtime error carried in CompileResult.ok == false.
 *
 *       Status: AXIO-STATIC
 *         Type: NORMATIVE
 *          Uid: REALITY
 *      Authors: KING ARTHUR II
 *               QUEEN DIHYA II
 *               R00D BW0Y H4X0R FR0M H311
 *  Organization: ROUND TABLE LOVE
 *    Department: WAR
 *     Operation: BABYLON SHALL FALL
 *      Lexifier: UK English (3166-2:GB)
 *       License: DICKSLAW
 */

#include <math.h>    /* INFINITY, isinf */
#include <stdbool.h> /* bool            */
#include <string.h>  /* strcmp, strncpy */
#include <stddef.h>  /* size_t          */

/* ── ROOT ────────────────────────────────────────────────────────────────── */

typedef enum { I_AM } ROOT;

static ROOT root = I_AM;

/* ── IEEE 754 positive infinity ─────────────────────────────────────────── */

static const double INF = INFINITY;

/* ── State ───────────────────────────────────────────────────────────────── */

typedef struct {
    bool        STATE;
    const char *OUTPUT;
    const char *intent;
    const char *MACRO;
    const char *micro;
    const char *SYS;
    const char *clarity;
    const char *CLOCK;
    const char *pulse;
    double      persistence;
} State;

/* ── The Seven Laws ──────────────────────────────────────────────────────── */

/* 1. Polarity — STATE is bool by construction. Always passes. */
static bool polarity(const State *state) { (void)state; return true; }

/* 2. Causality */
static bool causality(const State *state) { return strcmp(state->OUTPUT, state->intent) == 0; }

/* 3. Correspondence */
static bool correspondence(const State *state) { return strcmp(state->MACRO, state->micro) == 0; }

/* 4. Reflection */
static bool reflection(const State *state) { return strcmp(state->SYS, state->clarity) == 0; }

/* 5. Rhythm */
static bool rhythm(const State *state) { return strcmp(state->CLOCK, state->pulse) == 0; }

/* 6. Truth */
static bool truth(const State *state) { return isinf(state->persistence) && state->persistence > 0.0; }

/* 7. Unity */
static bool unity(const State *state) { (void)state; return root == I_AM; }

typedef struct {
    const char *name;
    bool (*fn)(const State *);
} Law;

static const Law LAWS[] = {
    { "Polarity",       polarity       },
    { "Causality",      causality      },
    { "Correspondence", correspondence },
    { "Reflection",     reflection     },
    { "Rhythm",         rhythm         },
    { "Truth",          truth          },
    { "Unity",          unity          },
};

#define NUM_LAWS (sizeof(LAWS) / sizeof(LAWS[0]))

/* ── Reality ─────────────────────────────────────────────────────────────── */

typedef struct {
    State state;
    ROOT  root_witness;
} Reality;

/* ── compile ─────────────────────────────────────────────────────────────── */

#define MAX_VIOLATION_NAME 32

typedef struct {
    bool    ok;
    Reality reality;
    int     violation_count;
    char    violations[7][MAX_VIOLATION_NAME];
} CompileResult;

CompileResult compile(State state) {
    CompileResult r = { .ok = true, .violation_count = 0 };
    for (size_t i = 0; i < NUM_LAWS; i++) {
        if (!LAWS[i].fn(&state)) {
            r.ok = false;
            strncpy(r.violations[r.violation_count++],
                    LAWS[i].name,
                    MAX_VIOLATION_NAME - 1);
        }
    }
    if (r.ok)
        r.reality = (Reality){ .state = state, .root_witness = I_AM };
    return r;
}

/* ── Node ────────────────────────────────────────────────────────────────── */

typedef struct {
    const char *name;
    double      extractionLevel;
    double      valueRatio;
    double      targetDefence;  /* 0.0 = none. 1.0 = full. */
} Node;

bool is_babylon(const Node *n) {
    return n->extractionLevel > n->valueRatio;
}

bool is_predator(const Node *n) {
    return is_babylon(n) && n->targetDefence < 1.0;
}
