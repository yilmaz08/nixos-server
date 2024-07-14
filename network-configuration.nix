{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "server";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 25 587 143 ];
      allowedUDPPorts = [ 22 80 443 25 587 143 ];
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
