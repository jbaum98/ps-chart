{ stdenv, callPackage, fetchurl, fetchzip, makeFontsConf, texlive, unzip, lmodern }:
let
  tex = texlive.combine {
  inherit (texlive)
    # The Basics
    scheme-basic xetex xetex-def euenc latexmk
    standalone
    # Polyglossia
    polyglossia bidi
    # Nice tables
    booktabs;
  };

  arimo = callPackage ./arimo.nix {};
  amiri = callPackage ./amiri.nix {};
  charis = callPackage ./charis.nix {};

  fonts = [ arimo amiri charis ];

in stdenv.mkDerivation {
  name = "proto-semitic-table";
  src = ./.;

  buildInputs = [
    tex
  ];

  buildPhase = ''
    latexmk --xelatex table.tex
  '';

  installPhase = ''
    mkdir -p $out
    cp table.pdf $out
  '';

  FONTCONFIG_FILE = makeFontsConf { fontDirectories = fonts; };
}
