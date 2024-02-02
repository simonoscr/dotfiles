{ config, pkgs, lib, ... }:
{
    virtualisation.oci-containers.containers = {
      "dashy" = {
        autoStart = true;
        image = "lissy93/dashy:latest";
        extraOptions = [ "--pull=always" ];
        environment = {
          "NODE_ENV" = "production";
          # TODO: use nix options to get right ids
          "UID" = "1000"; # jr
          "GID" = "131"; # docker
        };
        ports = [ "4000:80" ];
        volumes = [ "${configDir}/dashy/my-config.yml:/app/public/conf.yml" ];
      };
    };
}
