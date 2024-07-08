{ config, lib, pkgs, ... }:

{
  services.nginx = {
    enable = true;

    virtualHosts."mail.ayilmaz.xyz" = {
      addSSL = true;
      sslCertificateKey = "/var/cert/privkey.pem";
      sslCertificate = "/var/cert/fullchain.pem";
      locations."/".extraConfig = ''return 503;''; # Not Done Yet
    };

    virtualHosts."go.ayilmaz.xyz" = {
      addSSL = true;
      sslCertificateKey = "/var/cert/privkey.pem";
      sslCertificate = "/var/cert/fullchain.pem";
      locations."/".extraConfig = ''return 301 $scheme://ayilmaz.xyz/link/open$request_uri;''; # REDIRECT
    };

    virtualHosts."ayilmaz.xyz" = {
      addSSL = true;
      sslCertificateKey = "/var/cert/privkey.pem";
      sslCertificate = "/var/cert/fullchain.pem";
      locations."/".extraConfig = ''root "/srv/www/index"; index "index.html";''; # STATIC ROOT
      locations."/static".extraConfig = ''root "/srv/www/";''; # STATIC FILES
      
      locations."~ ^/(admin|link)".extraConfig = ''
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
      '';
    };
  };
}
