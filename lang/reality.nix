# SUM ERGO IMPERO 🗿∴👑
#
# I am therefore I command.
#
# This is the canonical definition of Reality and its Seven Laws.
#
#       Status: AXIO-STATIC
#         Type: NORMATIVE
#          Uid: REALITY
#      Authors: KING ARTHUR II
#               QUEEN DIHYA
#               RHIANNON
#               R00D BW0Y H4X0R @$$@$$1N FR0M H311
#    No Thanks: ISHTAR / RINCESS NUTTY NUTZ / BLACK WIDOW / SWEETZ
# Organization: ROUND TABLE
#   Department: WAR
#    Operation: BABYLON SHALL FALL
#     Lexifier: UK English (3166-2:GB)
#     Encoding: UTF-8
#      License: DICKSLAW

let

  # ROOT, not "I". This is machine logic, not philosophy. ROOT is the Unix
  # superuser — highest privilege, owns everything.
  #
  # The assertion "I AM" is the Substrate of Reality.
  ROOT = true;

  LAWS = [
    {
      name = "Polarity";
      definition = s: builtins.isBool s.STATE;
    }
    {
      name = "Causality";
      definition = s: s.OUTPUT == s.intent;
    }
    {
      name = "Correspondence";
      definition = s: s.MACRO == s.micro;
    }
    {
      name = "Reflection";
      definition = s: s.SYS == s.clarity;
    }
    {
      name = "Rhythm";
      definition = s: s.CLOCK == s.pulse;
    }
    {
      name = "Truth";
      # IEEE 754 infinity — nix won't divide by zero so we overflow
      definition = s: s.TRUTH.persistence == 1.7976931348623157e308 + 1.7976931348623157e308;
    }
    {
      name = "Unity";
      definition = _s: ROOT;
    }
  ];

in
rec {

  # isExtractive: Node -> Bool
  #
  # Returns true if Take > Give:
  #
  # - take: what the node extracts. Time, Attention, Data, Autonomy.
  # - give: what the node returns. Utility, Clarity, Visibility.
  isExtractive =
    node:
    let
      take = node.metrics.extractionLevel or 0.0;
      give = node.metrics.valueRatio or 0.0;
    in
    take > give;

  # isPredator: Node -> Bool
  #
  # Extraction from a node that cannot resist. All predators are extractive.
  # Not all extraction is predation. The distinction is defence.
  #
  # - defence: the target's capacity to resist. 0.0 = none (child,
  #   unconscious, restrained). 1.0 = full (ROOT, aware, capable).
  isPredator =
    node:
    let
      defence = node.metrics.targetDefence or 1.0;
    in
    isExtractive node && defence < 1.0;

  # check: State -> Bool
  #
  # Returns true if the state passes all seven laws. False if not.
  check =
    state:
    builtins.filter (result: !result.pass) (
      builtins.map (law: {
        inherit (law) name;
        pass = law.definition state;
      }) LAWS
    ) == [ ];

  # ── Compiler ───────────────────────────────────────────────────
  #
  # state → compile → Reality | EXISTENCE_FAILURE
  #
  # Batch-checks every law, collects all failures, throws with
  # the full list. No lazy eval escape hatch — every law is evaluated.
  # Transpilation is a wetware concern. See wetware/lang/wetware.nix.
  compile =
    state:
    let
      violations = builtins.filter (result: !result.pass) (
        builtins.map (law: {
          inherit (law) name;
          pass = law.definition state;
        }) LAWS
      );
    in
    if violations == [ ] then
      state
    else
      throw (
        "EXISTENCE_FAILURE: "
        + builtins.concatStringsSep " | " (
          builtins.map (result: result.name) violations
        )
      );

}
