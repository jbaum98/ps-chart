{ stdenv, fetchurl }:

let
  regular = fetchurl {
    url = "https://github.com/google/fonts/raw/d1cf288b5c6a7719d9eb405bd0f47298b01367a6/apache/arimo/Arimo-Regular.ttf";
    sha256 = "0j7135mskv4qjijnqpk61rp2b14av4j5w4kca0bhzlclkv4zizpa";
  };

  italic = fetchurl {
    url = "https://github.com/google/fonts/raw/d1cf288b5c6a7719d9eb405bd0f47298b01367a6/apache/arimo/Arimo-Italic.ttf";
    sha256 = "08v2mcirpf897gvpcn68h2wacpsbz71ml7q64gvb6j8jg2g25k7d";
  };

  bold = fetchurl {
    url = "https://github.com/google/fonts/raw/d1cf288b5c6a7719d9eb405bd0f47298b01367a6/apache/arimo/Arimo-Bold.ttf";
    sha256 = "0bj8pln96dnx4vi24qd0bqh14ppqkqiik2i3jqmcr90xibwaiac9";
  };

  bolditalic = fetchurl {
    url = "https://github.com/google/fonts/raw/d1cf288b5c6a7719d9eb405bd0f47298b01367a6/apache/arimo/Arimo-BoldItalic.ttf";
    sha256 = "16py68rlkjry0nc9459ay4cjqdpfbfyzz44fpdaqhbwvy2myih1m";
  };

in
stdenv.mkDerivation rec {
  name = "arimoFont";

  phases = [ "installPhase" ];

  installPhase = ''
    pwd
    echo $out
    mkdir -p $out/share/fonts/
    cp ${regular} $out/share/fonts/Arimo-Regular.ttf
    cp ${italic} $out/share/fonts/Arimo-Italic.ttf
    cp ${bold} $out/share/fonts/Arimo-Bold.ttf
    cp ${bolditalic} $out/share/fonts/Arimo-BoldItalic.ttf
  '';
}
