inputs: let
  username = "mozsoy";

  darwinModules = import ../../modules/darwin inputs;
  homeManagerModules = import ../../modules/home_manager inputs;
  aliasScript = import ./scripts/alias_script.nix username;

  mkDarwinConfig = username: appsModule:
    inputs.nix-darwin.lib.darwinSystem {
      modules = [
        (darwinModules.mkDarwin username)
        aliasScript
        homeManagerModules.homeManager
        appsModule
      ];
    };

  in {
    MacbookProFull = mkDarwinConfig username { 
      custom.apps = [ "vscode" "spotify" "htop" "uv" "cursor" "tex-live" "docker" "colima" "zsh" ]; 
    };
    MacbookProStandard = mkDarwinConfig username { 
      custom.apps = [ "vscode" "uv" ]; 
    };
    MacbookProMinimal = mkDarwinConfig username { 
      custom.apps = []; 
    };
  }
