{ stdenv, fetchurl }:
let
  regular = fetchurl {
    url = "https://github.com/google/fonts/raw/d1cf288b5c6a7719d9eb405bd0f47298b01367a6/ofl/amiri/Amiri-Regular.ttf";
    sha256 = "1wr57088lilc2nw0glqh0jf81k25zka5nlkhigb234rahz65s65x";
  };

  italic = fetchurl {
    url = "https://github.com/google/fonts/raw/d1cf288b5c6a7719d9eb405bd0f47298b01367a6/ofl/amiri/Amiri-Italic.ttf";
    sha256 = "0ax20cr3lhhgdikkd7nsprw5bbwbzvmgxjlrf8qjg1vansp80lh0";
  };

  bold = fetchurl {
    url = "https://github.com/google/fonts/raw/d1cf288b5c6a7719d9eb405bd0f47298b01367a6/ofl/amiri/Amiri-Bold.ttf";
    sha256 = "0wpgg7a1clfhh4pw299klic68lrdg09cy4b9kjiiaryyz12s26f5";
  };

  bolditalic = fetchurl {
    url = "https://github.com/google/fonts/raw/d1cf288b5c6a7719d9eb405bd0f47298b01367a6/ofl/amiri/Amiri-BoldItalic.ttf";
    sha256 = "1s3jfgnnlxb397xp2xi2lwvqnp7b2940xia5lx1gkvjmrakwl88g";
  };
in stdenv.mkDerivation rec {
  name = "arimoFont";

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/fonts/
    cp ${regular} $out/share/fonts/Arimo-Regular.ttf
    cp ${italic} $out/share/fonts/Arimo-Italic.ttf
    cp ${bold} $out/share/fonts/Arimo-Bold.ttf
    cp ${bolditalic} $out/share/fonts/Arimo-BoldItalic.ttf
  '';
}
