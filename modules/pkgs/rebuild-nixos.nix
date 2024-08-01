{
  writeShellScriptBin,
  bash,
  git,
  coreutils-full,
  nixos-rebuild,
  gnugrep,
}:
writeShellScriptBin "rebuild-nixos" ''
  #!${bash}/bin/bash
  cd /etc/nixos
  set -euo pipefail
  ${git}/bin/git diff
  read -p "Proceed? (Y/n) " resp
  if [[ "$resp" != "y" ]] && [[ "$resp" != "" ]]; then
      ${coreutils-full}/bin/echo "Exiting..."
      exit
  fi
  ${coreutils-full}/bin/echo "Testing build..."
  ${coreutils-full}/bin/sleep 1
  sudo ${nixos-rebuild}/bin/nixos-rebuild test --flake /etc/nixos/ &>nixos-switch.log || (${coreutils-full}/bin/cat nixos-switch.log | ${gnugrep}/bin/grep --color error && false)
  read -p "Commit? (Y/n) " commit
  if [[ "$commit" != "y" ]] && [[ "$commit" != "" ]]; then
      ${coreutils-full}/bin/echo "Exiting..."
      exit
  fi
  read -p "Commit message: " message
  if [[ "$message" == "" ]]; then
      gen=$(${nixos-rebuild}/bin/nixos-rebuild list-generations | ${gnugrep}/bin/grep current)
      ${git}/bin/git commit -am "$gen"
  else
      ${git}/bin/git commit -am "$message"
  fi
  sudo ${nixos-rebuild}/bin/nixos-rebuild switch --flake /etc/nixos &>nixos-switch.log || (${coreutils-full}/bin/cat nixos-switch.log | ${gnugrep}/bin/grep --color error && false)
  ${git}/bin/git show
''
