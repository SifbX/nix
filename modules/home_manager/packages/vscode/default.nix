{ pkgs, vscode-extensions, ... }:
let 
  pythonDevExtensions = import ./extensions/python.nix { inherit pkgs; };
  keyBindings = import ./keybindings.nix;
  extensions = pythonDevExtensions;
in
{
  programs.vscode = {
    enable = true;
    profiles.Default.extensions = extensions;
    profiles.Default.keybindings = keyBindings;
  };
  # home.packages = [ pkgs.vscode ];
}