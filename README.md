# Install and configure home-manager with flakes

## Home-manager installation as logged in normal user

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz home-manager

nix-channel --update

logout

nix-shell '<home-manager>' -A install

home-manager --version
```

## Clone remote repo and deploy

```sh
gh auth login

rm -rf ~/.config/nixpkgs/home.nix

git clone https://github.com/mudrii/hmtst.git ~/.config/nixpkgs --depth 1

nix flake update ~/.config/nixpkgs

home-manager switch --flake ~/.config/nixpkgs/#$USER -v
```
