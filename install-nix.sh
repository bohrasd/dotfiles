#lxc config set penguin security.nesting true
#sh <(curl -L https://nixos.org/nix/install) --no-daemon
. $HOME/.nix-profile/etc/profile.d/nix.sh
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-env -iA cachix -f https://cachix.org/api/v1/install
nix-shell '<home-manager>' -A install
cachix use nixpkgs

if [[ -d /opt/google/cros-containers/ ]]; then
  mkdir -p ~/.config/systemd/user/cros-garcon.service.d/
  cat > ~/.config/systemd/user/cros-garcon.service.d/override.conf <<EOF
[Service]
Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:/usr/local/share:/usr/share"
EOF

  sudo apt-get update
  sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg \
     lsb-release

  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io
fi

cp ./home.nix ~/.config/nixpkgs/home.nix
home-manager switch
