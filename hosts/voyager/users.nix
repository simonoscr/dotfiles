{
  config,
  pkgs,
  inputs,
  ...
}: {
  users = {
    mutableUsers = false; # disable useradd + passwd

    users = {
      root = {
        hashedPassword = "*"; # set a invalid hashed password "disables" root
      };
      nixos = {
        group = "nixos";
        hashedPasswordFile = config.sops.secrets.dXNlcl9wYXNzd29yZA.path;
        isNormalUser = true;
        extraGroups = [
          "wheel"
        ];
        shell = pkgs.zsh;
      };
      host = {
        group = "host";
        initialPassword = "123";
        #hashedPasswordFile = config.sops.secrets.dXNlcl9wYXNzd29yZA.path;
        isNormalUser = true;
        extraGroups = [
          "wheel"
        ];
        shell = pkgs.zsh;
      };
      libvirtd = {
        group = "libvirtd";
        home = "/var/lib/libvirtd";
        createHome = true;
        isSystemUser = true;
      };
    };
    groups = {
      nixos = {};
      libvirtd = {};
      host = {};
    };
  };
}