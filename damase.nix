{ stdenv, fetchzip }:
stdenv.mkDerivation {
  name = "damaseFont";

  src = fetchzip {
    url = "http://www.wazu.jp/downloads/damase_v.2.zip";
    sha256 = "1xf61w6vhy5qbhnn45s77fxyryn66blf641lhmgiqr1pww7zq7p3";
  };

  doBuild = false;

  installPhase = ''
    mkdir -p $out/share/fonts/
    cp *.ttf $out/share/fonts/
  '';
}
