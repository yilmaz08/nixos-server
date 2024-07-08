{ config, lib, pkgs, ... }:

{
  users.users.yilmaz = {
    isNormalUser = true;
    hashedPassword = ""; # Can't share obviously
    extraGroups = [ "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };
}