{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  nix = {
    package = pkgs.nixVersions.latest;
    # pin the registry to avoid downloading and evaling a new nixpkgs version every time
    registry = lib.mapAttrs (_: v: { flake = v; }) inputs;

    # set the path for channels compat
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      # Whether to accept nix configuration from a flake without prompting.
      accept-flake-config = true;
      cores = 0;
      max-jobs = "auto";
      connect-timeout = 5;
      http-connections = 0;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      allowed-users = [ "root" ];
      trusted-users = [ "root" ];
      flake-registry = "/etc/nix/registry.json";
      keep-derivations = true;
      keep-outputs = true;
      fallback = true;
      warn-dirty = false;
    };
    gc = {
      automatic = false;
      options = "--delete-older-than 1w";
    };
  };
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };
}
