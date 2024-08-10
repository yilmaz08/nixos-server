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

  # code-server
  services.code-server = {
    enable = true;
    auth = "password";
    disableTelemetry = true;
    host = "...";
    hashedPassword = "...";
    user = "...";
    group = "...";
  };

  ### CUSTOM ###
  # Arch Wiki Turkiye Telegram Bot
  systemd.services.archwikitrbot = {
    enable = true;
    # name = "archwikitrbot";
    description = "ArchWiki Turkiye Telegram Group Bot";
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      RestartSec = "5min";
      Restart = "on-failure";

      # ExecStartPre = "/bin/sh -c 'until ping -c1 archlinux.org; do sleep 1; done;'";
      ExecStart = "/srv/bot/archwiki/env/bin/python /srv/bot/archwiki/main.py";
    };
  };
  # Django Server
  systemd.services.django = {
    enable = true;
    description = "Django Server";
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      RestartSec = "5min";
      Restart = "on-failure";

      ExecStart = "/srv/www/django/env/bin/python /srv/www/django/manage.py runserver 0.0.0.0:8000";
    };
  };
}
