{ config, lib, pkgs, ... }:

{
  # openssh
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  services.logind.lidSwitch = "ignore";
  virtualisation.docker.enable = true;

  ### CUSTOM ###  
  # Django Server
  systemd.services.django = {
    enable = true;
    description = "Django Server";
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      RestartSec = "5min";
      Restart = "on-failure";

      ExecStart = "/srv/www/django/env/bin/python /srv/www/django/manage.py runserver 0.0.0.0:8080";
    };
  };
}
