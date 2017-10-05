{ stdenv, fetchurl }:
let
  ttf = fetchurl {
    url = "http://www.sbl-site.org/Fonts/SBL_Hbrw.ttf";
    sha256 = "16cyrxqpnrw57qi9mr1941hl3bwlx6hdd0n20pi89ybsr7naiv4q";
  };
in stdenv.mkDerivation rec {
  name = "sblFont";

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/fonts/
    cp ${ttf} $out/share/fonts/SBL_Hebrew.ttf
  '';
}
