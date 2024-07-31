{writeShellScriptBin}:
writeShellScriptBin "rebuild-nixos" (builtins.readFile ./rebuild-nixos.sh)
