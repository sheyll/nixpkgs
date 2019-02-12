{ stdenv, lib, fetchFromGitHub, fetchurl
, libusb, libusb1, unzip, zlib, ncurses, readline
, pkgconfig, libtool, autoconf, automake, autogen, gnumake
, python, pythonPackages
}:

stdenv.mkDerivation rec {
  version = "1.22";
  name = "esptoolchain";

  src = fetchFromGitHub {
      owner = "espressif";
      repo = "crosstool-NG";
      rev = "6c4433a51e4f2f2f9d9d4a13e75cd951acdfa80c";
      sha256 = "0cf15dspmzcnfda8w5lbsdx28m4v2rpq1dv5zx0r0n99ihqd1sh6";
  };
  
  buildInputs = [autoconf autogen automake zlib ncurses readline libusb libusb1 python];

  meta = with stdenv.lib; {
    description = "crosstool-NG toolchain for Espressif ESP32 xtensa";
    homepage = https://github.com/espressif/crosstool-NG;
    license = licenses.gpl2;
    platforms = platforms.linux;
    maintainers = ["Sven Heyll <sven.heyll@gmail.com>"];
  };
}
