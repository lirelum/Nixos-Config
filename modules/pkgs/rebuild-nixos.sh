#!/usr/bin/env bash
cd /etc/nixos
set -euo pipefail
git diff
read -p "Proceed? (Y/n) " resp
if [[ "$resp" != "y" ]] && [[ "$resp" != "" ]]; then
    echo "Exiting..."
    exit
fi
echo "Testing build..."
sleep 1
sudo nixos-rebuild test --flake /etc/nixos/ &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)
read -p "Commit? (Y/n) " commit
if [[ "$commit" != "y" ]] && [[ "$commit" != "" ]]; then
    echo "Exiting..."
    exit
fi
read -p "Commit message: " message
if [[ "$message" == "" ]]; then
    gen=$(nixos-rebuild list-generations | grep current)
    git commit -am "$gen"
else
    git commit -am "$message"
fi
sudo nixos-rebuild switch --flake /etc/nixos &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)
git show