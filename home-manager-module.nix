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

    programs.bash = {
      enable = true;
      bashrcExtra = ''
        PS1='\[\e[0;36m\]\u\[\e[0m\]@\[\e[31m\]\h \[\e[93m\]\w \[\e[38;5;23m\]\j\[\e[0m\]\$ '
      '';
    };

    programs.vim = {
      enable = true;
      # plugins = with pkgs.vimPlugins; [ ];
      # settings = { ignorecase = true; };
      extraConfig = ''
        set mouse=a
        set nocompatible nowrap
        set nu rnu
      '';
    };

    programs.git = {
      enable = true;
      userName = "if";
      userEmail = "iflossahedron@maildepot.net";
      ignores = [ "*.swp" ];
      extraConfig = {
        init = { defaultBranch = "main"; };
      };
      aliases = {
        s = "status";
        b = "branch";
      };
    };
  };

}
