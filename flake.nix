{
  description = "Kanto Expansion Pack Romhack";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-23.05;
    flake-utils.url = github:numtide/flake-utils;
  };
  outputs = { self, nixpkgs, flake-utils, ... }:
    let
      kepDerivation = { stdenv, src, pkgs,
        make ? pkgs.gnumake,
        gcc ? pkgs.gcc,
        rgbds ? pkgs.rgbds,
        files ? ["*.*gb*"],
        # python3 ? pkgs.python3,
      }: stdenv.mkDerivation rec {
          src = ./.;
          name = "kep-hack";
          buildInputs = [ rgbds gcc make ];
          installPhase = ''
            shopt -s extglob
            mkdir $out
            ${builtins.concatStringsSep "\n" (map (item: 
                if builtins.isList item && (builtins.length item == 2)
                then "mv ${builtins.elemAt item 0} $out/${builtins.elemAt item 1}"
                else "cp ${item}* $out"
              ) files)}
          '';
        };
    in flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; overlays = [self.overlays.default]; };
    in {
      packages = {
        default = pkgs.kep-hack;
        kep-hack = pkgs.kep-hack;
      };
      devShells = {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            rgbds
            gcc
            gnumake
            sameboy
            imagemagick
          ];
        };
      };
    }) // {
      overlays = {
        default = final: prev: {
          kep-hack = final.callPackage kepDerivation {
            files = [
              ["kep.gbc" "kanto-expansion-pak-renewables.gbc"]
              ["kep.sym" "kanto-expansion-pak-renewables.sym"]
            ];
          };
        };
      };
    };
}
