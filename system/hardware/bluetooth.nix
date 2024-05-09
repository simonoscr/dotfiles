{pkgs, ...}: {
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez5-experimental;
  };

  # https://github.com/NixOS/nixpkgs/issues/114222
  systemd.user.services.telephony_client.enable = false;
}
