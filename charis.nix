{ stdenv, fetchzip }:
stdenv.mkDerivation {
  name = "charis-SIL";
  src = fetchzip {
    url = "https://software.sil.org/downloads/r/charis/CharisSIL-5.000.zip";
    sha256 = "152182hmr9wmpffc54iqzjf9gww3rvbvkkcgmfd04ryq4rxnqmx6";
  };

  doBuild = false;

  installPhase = ''
    mkdir -p $out/share/fonts
    cp *.ttf $out/share/fonts/
  '';
}
