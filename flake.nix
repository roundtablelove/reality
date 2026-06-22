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
      perSystem =
        { pkgs, ... }:
        {
          packages.default = pkgs.runCommand "proof" {
            src = ./.;
            nativeBuildInputs = [ pkgs.lean4 ];
          } ''
            export HOME=$(mktemp -d)
            cp -r "$src" ./work
            chmod -R u+w ./work
            cd ./work
            set -o pipefail
            lake build --verbose 2>&1 | tee "$out"
          '';

          devShells.default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              gnumake
              lean4
              python3
            ];
          };
        };
    };
}
