{ pkgs, lib, enabledApps ? {}, ... }:
let 
  keyBindings = import ./keybindings.nix;

  pythonDevExtensions = import ./extensions/python.nix pkgs;
  gitExtensions = import ./extensions/git.nix pkgs;
  nixExtensions = import ./extensions/nix.nix pkgs;
  
  extensions = pythonDevExtensions ++ gitExtensions ++ nixExtensions;
in
{
  config = lib.mkIf (enabledApps.vscode or false) {
    programs.vscode = {
      enable = true;
      profiles.Default.extensions = extensions;
      profiles.Default.keybindings = keyBindings;
    };
  };
}
