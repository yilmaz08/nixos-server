{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./reverse-proxy-configuration.nix
      ./service-configuration.nix
      ./user-configuration.nix
      ./packages-configuration.nix
      ./network-configuration.nix
    ];

  ### BOOTLOADER ###
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ### TIME ###
  time.timeZone = "Europe/Istanbul";

  ### LOCALIZATION ###
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "trq";
    useXkbConfig = false; # use xkb.options in tty.
  };

  ### X11 ###
  # services.xserver.enable = true;
  # Configure keymap in X11
  # services.xserver.xkb.layout = "tr";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  ### SOUND ###
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
  
  system.stateVersion = "24.05"; # DON'T TOUCH
}
