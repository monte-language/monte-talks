{ nixpkgs ? import <nixpkgs> {} }:
let
  inherit (nixpkgs) pkgs;
in pkgs.stdenv.mkDerivation {
  name = "talks-env";
  buildInputs = with pkgs; [
    git
    texlive.combined.scheme-medium
    texlive.bin.xdvi
    lyx hunspellDicts.en-us
    firefox impressive
  ];
}
