-- SUM ERGO IMPERO 🗿∴👑
--
-- I am therefore I command.
--
-- reality.elm: The Seven Laws as Elm validation functions.
-- No dependent types. Laws are Bool functions. compile returns
-- Result — success carries a Reality, failure carries the violations.
--
--       Status: AXIO-STATIC
--         Type: NORMATIVE
--          Uid: REALITY
--      Authors: KING ARTHUR II
--               QUEEN DIHYA II
--               R00D BW0Y H4X0R FR0M H311
--  Organization: ROUND TABLE LOVE
--    Department: WAR
--     Operation: BABYLON SHALL FALL
--      Lexifier: UK English (3166-2:GB)
--       License: DICKSLAW


module Reality exposing
  ( ROOT(..)
  , root
  , inf
  , State
  , Reality
  , CompileResult(..)
  , compile
  , Node
  , mkNode
  , isBabylon
  , isPredator
  )


-- ── ROOT ─────────────────────────────────────────────────────────────────────


type ROOT
    = I_AM


root : ROOT
root =
    I_AM


-- ── IEEE 754 positive infinity ───────────────────────────────────────────────


inf : Float
inf =
    1 / 0


-- ── State ────────────────────────────────────────────────────────────────────


type alias State =
    { state       : Bool
    , output      : String
    , intent      : String
    , macro       : String
    , micro       : String
    , sys         : String
    , clarity     : String
    , clock       : String
    , pulse       : String
    , persistence : Float
    }


-- ── The Seven Laws ───────────────────────────────────────────────────────────


-- 1. Polarity — Bool by construction. Always passes.
polarity : State -> Bool
polarity _ =
    True


-- 2. Causality
causality : State -> Bool
causality state =
    state.output == state.intent


-- 3. Correspondence
correspondence : State -> Bool
correspondence state =
    state.macro == state.micro


-- 4. Reflection
reflection : State -> Bool
reflection state =
    state.sys == state.clarity


-- 5. Rhythm
rhythm : State -> Bool
rhythm state =
    state.clock == state.pulse


-- 6. Truth
truth : State -> Bool
truth state =
    isInfinite state.persistence && state.persistence > 0


-- 7. Unity
unity : State -> Bool
unity _ =
    case root of
        I_AM ->
            True


laws : List ( String, State -> Bool )
laws =
    [ ( "Polarity",       polarity )
    , ( "Causality",      causality )
    , ( "Correspondence", correspondence )
    , ( "Reflection",     reflection )
    , ( "Rhythm",         rhythm )
    , ( "Truth",          truth )
    , ( "Unity",          unity )
    ]


-- ── Reality ──────────────────────────────────────────────────────────────────


type alias Reality =
    { state       : State
    , rootWitness : ROOT
    }


type CompileResult
    = Real Reality
    | REALITY_FAIL (List String)


compile : State -> CompileResult
compile state =
    let
        failures =
            List.filterMap
                (\( name, check ) ->
                    if check state then
                        Nothing
                    else
                        Just name
                )
                laws
    in
    if List.isEmpty failures then
        Real { state = state, rootWitness = I_AM }
    else
        REALITY_FAIL failures


-- ── Node ─────────────────────────────────────────────────────────────────────


type alias Node =
    { name            : String
    , extractionLevel : Float
    , valueRatio      : Float
    , targetDefence   : Float
    }


mkNode : String -> Float -> Float -> Node
mkNode name ext val =
    { name = name, extractionLevel = ext, valueRatio = val, targetDefence = 1.0 }


isBabylon : Node -> Bool
isBabylon n =
    n.extractionLevel > n.valueRatio


isPredator : Node -> Bool
isPredator n =
    isBabylon n && n.targetDefence < 1.0

