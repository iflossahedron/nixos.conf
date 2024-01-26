# https://nixos.wiki/wiki/Home_Manager
# Owned by 'root' and re-evaluated by 'sudo nixos-rebuild'
{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.ow = {
    home.stateVersion = "23.11";
    home.packages = [ pkgs.htop pkgs.cowsay ];
    # will be reevaulated upon nixos-rebuild

    programs.git = {
      enable = true;
      userName = "if";
      userEmail = "iflossahedron@maildepot.net";
      defaultBranch = "main";
      aliases = {
        s = "status";
        b = "branch";
      };
    };
  };

}
