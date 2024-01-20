{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  security.sudo.execWheelOnly = true;

  environment.defaultPackages = lib.mkForce []; # no extra default packages are installed
}
