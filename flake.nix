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
          apps.proof = {
            type = "app";
            program =
              let
                script = pkgs.writeShellApplication {
                  name = "proof";
                  runtimeInputs = [ pkgs.lean4 ];
                  text = ''
                    lake build --verbose
                  '';
                };
              in
              "${script}/bin/proof";
          };

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
