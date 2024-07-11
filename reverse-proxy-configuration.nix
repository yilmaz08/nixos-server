{ config, lib, pkgs, ... }:

{
  services.nginx = {
    enable = true;
    config = (builtins.readFile ./nginx.conf);
  };
}
