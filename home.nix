{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "bohrasdf";
  home.homeDirectory = "/home/bohrasdf";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
  home.packages = [
    pkgs.jq
    pkgs.htop
    pkgs.fortune
    pkgs.neovim-nightly
    pkgs.navi
    pkgs.tmux
    pkgs.fzf
    pkgs.ripgrep
    pkgs.starship
  ];

  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.initExtra = ''
    source ~/.dotfiles/.zshrc
  '';
  
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
}
