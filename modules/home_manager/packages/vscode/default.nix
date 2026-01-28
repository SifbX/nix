{ pkgs, vscode-extensions, ... }:
let 
  keyBindings = import ./keybindings.nix;

  pythonDevExtensions = import ./extensions/python.nix pkgs;
  gitExtensions = import ./extensions/git.nix pkgs;
  nixExtensions = import ./extensions/nix.nix pkgs;
  
  extensions = pythonDevExtensions ++ gitExtensions ++ nixExtensions;
in
{
  programs.vscode = {
    enable = true;
    profiles.Default.extensions = extensions;
    profiles.Default.keybindings = keyBindings;
  };
}