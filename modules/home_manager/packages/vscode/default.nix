{ pkgs, ... }:
let 
  keyBindings = import ./keybindings.nix;

  pythonDevExtensions = import ./extensions/python.nix pkgs;
  gitExtensions = import ./extensions/git.nix pkgs;
  nixExtensions = import ./extensions/nix.nix pkgs;
  aiExtensions = import ./extensions/ai.nix pkgs;
  
  extensions = pythonDevExtensions ++ gitExtensions ++ nixExtensions ++ aiExtensions;
in
{
  programs.vscode = {
    enable = true;
    profiles.Default.extensions = extensions;
    profiles.Default.keybindings = keyBindings;
  };
}
