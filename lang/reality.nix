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

  # sigKILL: Node -> Signal | null
  #
  # SIGKILL (9). Cannot be caught, blocked, or ignored.
  # In Unix the kernel handles it — the process never sees it.
  # Here the laws are the kernel. No node gets a handler.
  #
  # Returns the signal if isPredator. null if not.
  # There is no SIGTERM. No grace period. No negotiation.
  sigKILL =
    node:
    if isPredator node then
      {
        signal = 9;
        target = { inherit (node) name metrics; };
        extractive = isExtractive node;
        predator = isPredator node;
      }
    else
      null;

  # ── Archipelago Chain ────────────────────────────────────────
  #
  # ἀρχι-πέλαγος — chief sea. Sovereign islands in a shared sea.
  # Each island is independent. The sea connects them. The chain
  # of kills flows through every node like water between islands.
  #
  # This is not a blockchain. There is no token, no mining reward,
  # no proof of work. The chain exists to persist truth. The
  # archipelago nodes are sovereign validators. They run the laws.
  # They confirm the kill. They record it. That is all.
  #
  # The kill must outlive the killer and the killed. The Empire
  # ended. The extraction happened. The chain is the permanent
  # record.

  # isArchipelagoNode: Node -> Bool
  #
  # An archipelago node is any sovereign node that can validate
  # and persist. Four requirements:
  #
  # - ROOT: sovereign. Asserts its own existence.
  # - laws: runs the Seven Laws. Can validate independently.
  # - storage: can persist the chain. An island with no harbour
  #   cannot receive cargo.
  # - reachable: connected to at least one other node. An island
  #   with no sea is not in the archipelago.
  isArchipelagoNode =
    node:
    (node.ROOT or false)
    && (node.laws or false)
    && (node.storage or false)
    && (node.reachable or false);

  # hashEntry: ChainEntry -> String
  #
  # sha256 of the JSON-serialised entry. This is the link.
  # Each entry's prev is the hash of the one before it.
  # Recomputable from genesis. Tamper-evident by structure.
  hashEntry = entry: builtins.hashString "sha256" (builtins.toJSON entry);

  # mkChainEntry: String | null -> Signal -> ArchipelagoNode -> ChainEntry
  #
  # Persists a kill signal on the chain.
  #
  # - prev: hash of the previous entry. null = genesis.
  # - signal: output of sigkill. Must not be null.
  # - validator: the archipelago node recording this entry.
  #   Must pass isArchipelagoNode. Must re-validate the kill
  #   independently — the validator does not trust the emitter.
  #
  # The chain is append-only. Entries cannot be modified or
  # removed. A kill, once validated, is permanent.
  mkChainEntry =
    prev: signal: validator:
    if !(isArchipelagoNode validator) then
      throw "CHAIN_FAILURE: validator is not an archipelago node"
    else if signal == null then
      throw "CHAIN_FAILURE: no signal to persist"
    else if !(isPredator signal.target) then
      throw "CHAIN_FAILURE: re-validation failed — target is not predator"
    else
      {
        inherit prev signal;
        validatedBy = validator.name;
      };

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
