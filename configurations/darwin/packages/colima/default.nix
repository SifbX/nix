{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.colima ];
}