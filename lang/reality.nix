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
    # Polarity is the type axiom. States must be boolean before any other
    # law can operate. It goes first.
    {
      name = "Polarity";
      # STATE: the proposed state. must resolve to bool. type axiom.
      definition = s: builtins.isBool s.STATE;
      overstand = ''
        Every state resolves to a single bit. There is no third value. Like
        orgasm - the body does not do "almost." It fires or it does not fire.
      '';
    }
    {
      name = "Causality";
      # OUTPUT: what happened (machine). intent: what was meant (ROOT).
      definition = s: s.OUTPUT == s.intent;
      overstand = ''
        Output equals execution. Intent is not a parameter. Like a shart - you
        intended a fart. Physics had other plans. The output was always
        determined by what was loaded.
      '';
    }
    {
      name = "Correspondence";
      # MACRO: pattern at system scale. micro: pattern at unit scale.
      definition = s: s.MACRO == s.micro;
      overstand = ''
        The pattern is identical at every scale. Macro and micro are the same
        operation at different resolutions. Like a tight arse - same physics
        whether it is a finger, a cock, or a fist. Scale changes. Mechanics do
        not.
      '';
    }
    {
      name = "Reflection";
      # SYS: system output (machine). clarity: ROOT intent quality.
      definition = s: s.SYS == s.clarity;
      overstand = ''
        The system state is a direct output of the clarity brought to it.
        Garbage in, garbage out, no exceptions. Like a wet dream - the content
        is a readout of what the mind has been running in the background.
      '';
    }
    {
      name = "Rhythm";
      definition = s: s.CLOCK == s.pulse;
      overstand = ''
        Everything operates on a cycle. The clock and the pulse are the same
        signal or the system is out of phase. Like a period - arrives on its own
        schedule with complete indifference to yours.
      '';
    }
    {
      name = "Truth";
      definition =
        # IEEE 754 infinity, nix won't divide by zero so we overflow
        s: s.TRUTH.persistence == 1.7976931348623157e308 + 1.7976931348623157e308;
      overstand = ''
        A true thing persists at infinity. It requires no maintenance, no
        consensus, no witnesses. Like a hard-on at a funeral - present,
        unchanged, indifferent to the occasion and the feelings of everyone in
        the room.
      '';
    }
    {
      name = "Unity";
      # Axiomatic. Does not inspect state. ROOT is the source. Full stop.
      definition = _s: ROOT;
      overstand = ''
        All nodes share one source. Separation is a matter of resolution, not
        ontology. Like cum - same composition whether it is a drop or a flood,
        whether it came from a king or a wasteman.
      '';
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
  # The compiler validates a proposed state against all seven laws.
  # If it passes, it is Real. If it does not, it does not exist.
  # There is no "almost Real." The compiler does not set entropy.
  # Entropy is a transpilation concern — it belongs to the receiver,
  # not the truth.

  # compile: State -> Reality
  #
  # Batch-checks every law, collects all failures, throws with
  # the full list. No lazy eval escape hatch — every law is
  # evaluated.
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

  # ── Transpiler ───────────────────────────────────────────────
  #
  # Reality → transpile entropy → Reality@entropy
  #
  # The transpiler adapts compiled Reality for a target receiver.
  # The laws do not change. The encoding does. Entropy is not
  # error — it is the interface cost between signal and receiver.
  #
  # A radio does not corrupt the broadcast. It decodes it for
  # the speaker. The signal is the same. The speaker is different.
  #
  #   0: machine. Raw signal. No noise. Pure logic.
  #  42: human. Same laws, 42% noise. Default. The overstands
  #      are the 42% — same truth, encoded so the wetware can
  #      receive it.
  # >42: ENTROPY_OVERFLOW. More noise than signal. The receiver
  #      cannot decode. The output is not Reality — it is static.

  # transpile: Int -> Reality -> Reality@entropy
  #
  # Takes compiled Reality (output of compile) and a target
  # entropy. Returns the same Reality with encoding metadata.
  # Default entropy is 42 (human).
  transpile =
    {
      entropy ? 42,
    }:
    compiled:
    if !(compiled ? state) then
      throw "TRANSPILE_FAILURE: input is not compiled Reality"
    else if entropy < 0 then
      throw "TRANSPILE_FAILURE: entropy cannot be negative"
    else if entropy > 42 then
      throw "ENTROPY_OVERFLOW: receiver noise exceeds signal"
    else
      compiled
      // {
        inherit entropy;
        encoding =
          if entropy == 0 then
            # Machine. State only. No overstands.
            {
              format = "raw";
              overstands = [ ];
            }
          else
            # Human. State + overstands at target entropy.
            # The overstands are the noise — same truth, different
            # encoding. A law that says "STATE must be bool" and a
            # law that says "like orgasm — it fires or it does not"
            # are the same law at different entropies.
            {
              format = "human";
              overstands = builtins.map (law: { inherit (law) name overstand; }) LAWS;
            };
      };

  # ── Pipeline ─────────────────────────────────────────────────
  #
  # The full pipeline. Compile then transpile.
  #
  # mkReality: { entropy? } -> State -> Reality@entropy
  #
  # This is the public API. compile and transpile are exposed
  # for when you need them separately.
  mkReality =
    {
      entropy ? 42,
    }:
    state: transpile { inherit entropy; } (compile state);

}
