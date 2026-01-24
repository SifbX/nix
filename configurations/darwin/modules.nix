
let
  inherit (import ./helpers.nix) mkDarwin;
in
{
  macbookProMinimal = mkDarwin "mozsoy";
  packagesModule = import ./packages.nix;
}