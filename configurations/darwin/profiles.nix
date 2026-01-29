# Simple attrset of enabled apps per profile
# Passed via specialArgs to both darwin and home-manager modules
{
  full = {
    spotify = true;
    vscode = true;
    cursor = true;
    uv = true;
    htop = true;
    docker = true;
    colima = true;
    texlive = true;
    zsh = true;
  };
  
  standard = {
    spotify = true;
    vscode = true;
    uv = true;
  };
  
  minimal = {
    # No packages enabled
  };
}
