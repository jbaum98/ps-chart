{ lib, stdenv, callPackage, makeFontsConf, texlive }:
let
  tex = texlive.combine {
  inherit (texlive)
    # The Basics
    scheme-basic xetex xetex-def euenc latexmk
    standalone
    # Polyglossia
    polyglossia bidi hyphen-arabic
    # Nice tables
    booktabs multirow
    # Debugging
    eso-pic;
  };

  sbl = callPackage ./sbl.nix {};
  amiri = callPackage ./amiri.nix {};
  charis = callPackage ./charis.nix {};

  fonts = [ sbl amiri charis ];

in stdenv.mkDerivation {
  name = "proto-semitic-table";

  buildInputs = [
    tex
  ];

  phases = [ "buildPhase" "installPhase" ];

  buildPhase = ''
    latexmk --xelatex ${./table.tex} -jobname=table
  '';

  installPhase = ''
    mkdir -p $out
    cp table.pdf $out
  '';

  FONTCONFIG_FILE = makeFontsConf { fontDirectories = fonts; };
}
