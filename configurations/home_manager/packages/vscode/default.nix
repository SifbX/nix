{ pkgs, ... }:
let 
  pythonDevExtensions = import ./extensions/python.nix;
  keyBindings = import ./keybindings.nix;
  extensions = pythonDevExtensions;
in
{
  programs.vscode = {
    enable = true;
    extensions = extensions;
    profiles.Default.keybindings = keyBindings;
  };
  home.packages = [ pkgs.vscode ];
}