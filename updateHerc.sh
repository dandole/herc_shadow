cd
rm -rf hercules-helper
rm -rf herc
git clone https://github.com/wrljet/hercules-helper.git
mkdir herc
cd herc
~/hercules-helper/hercules-buildall.sh --auto --flavor=sdl-hyperion
cd
rm -rf herc/hyperion
hercules --version
