{ pkgs, ... }:
let 
  keyBindings = import ./keybindings.nix;
  userSettings = import ./settings.nix;

  pythonDevExtensions = import ./extensions/python.nix pkgs;
  gitExtensions = import ./extensions/git.nix pkgs;
  nixExtensions = import ./extensions/nix.nix pkgs;
  aiExtensions = import ./extensions/ai.nix pkgs;
  rustExtensions = import ./extensions/rust.nix pkgs;
  
  extensions = pythonDevExtensions ++ gitExtensions ++ nixExtensions ++ aiExtensions ++ rustExtensions;
in
{
  programs.vscode = {
    enable = true;
    profiles.memo.extensions = extensions;
    profiles.memo.keybindings = keyBindings;
    profiles.memo.userSettings = userSettings;
  };
}
