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


# Enable home-manager auto update service
systemctl --user enable nixos-hm-auto-update.service

# Enable vscode remote ssh fix service
systemctl --user enable nixos-vscode-ssh-fix.service
```

## Auto fix for vscode remote ssh issue

```sh
# ssh to remote NixOS box
# start the service named nixos-vscode-server
systemctl --user start nixos-vscode-ssh-fix.service
# Retry VSCode Remote SSH
# restart the service if remote SSH still not working
systemctl --user restart nixos-vscode-ssh-fix.service
```

## Manual workaround for vscode remote ssh issue

```sh
# ssh to remote NixOS box
# discover the hashed directory installed in ~/.vscode-server-insiders/bin/
cd ~/.vscode-server-insiders/bin/d13d2fc56da7a2f8bcad4256212db0661fcbba45
rm -rf node
ln -s $(which node)
# Retry VSCode Remote SSH
```
