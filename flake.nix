{

  description = "SUM ERGO IMPERO 🗿∴👑";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {

      systems = import inputs.systems;

      perSystem = { pkgs, ... }: {

        packages.default = pkgs.haskellPackages.callCabal2nix "reality" ./. { };

        checks.lean =
          pkgs.runCommand "reality-lean-proofs" { nativeBuildInputs = [ pkgs.lean4 ]; }
            ''
              set -eu -o pipefail
              export HOME=$(mktemp -d)
              cp -r ${./tests/lean} lean-work
              chmod -R u+w lean-work
              cd lean-work
              lake build --verbose 2>&1 | tee $out
            '';

        devShells.default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            ghc
            lean4
          ];
        };

      };

      flake = {

        overlays.default = _final: prev: {
          haskellPackages = prev.haskellPackages.extend (
            hself: _: { reality = hself.callCabal2nix "reality" ./. { }; }
          );
        };

        source = ./Reality.hs;

      };

    };
}
