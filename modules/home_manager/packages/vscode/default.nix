{ pkgs, vscode-extensions, ... }:
let 
  pythonDevExtensions = import ./extensions/python.nix pkgs;
  gitExtensions = import ./extensions/git.nix pkgs;
  nixExtensions = import ./extensions/nix.nix pkgs;
  keyBindings = import ./keybindings.nix;
  extensions = pythonDevExtensions ++ gitExtensions ++ nixExtensions;
in
{
  programs.vscode = {
    enable = true;
    profiles.Default.extensions = extensions;
    profiles.Default.keybindings = keyBindings;
  };
}