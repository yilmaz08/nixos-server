{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    acpi
    openssh
    python3
    rsync
    git
    wget
    nginx
    pass
    gnupg
    ncdu
    pinentry-curses
    lsof
    docker
    thttpd
    htop
    tmux
    fish
  ];

  programs.fish.enable = true;
}
