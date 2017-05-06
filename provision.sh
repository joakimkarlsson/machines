# Install desktop environment
sudo apt install software-properties-common -y

# Needed for libxcb-xrm-dev, needed by i3wm
sudo add-apt-repository ppa:aguignard/ppa -y
sudo apt update

# Install Xfce4
sudo apt install xubuntu-desktop gnome-terminal menu --no-install-recommends -y
sudo apt install polybar gnome-terminal xfwm4-themes xfce4-terminal --no-install-recommends -y

# Dependencies for i3-gaps
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev libxcb-xrm-dev -y

# Get i3-gaps
if [[ ! -d ~/i3-gaps ]]; then
    git clone https://www.github.com/Airblader/i3 ~/i3-gaps
else
    pushd ~/i3-gaps
    git pull
    popd
fi

pushd ~/i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

popd
