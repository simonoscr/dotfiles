{ config, pkgs, ... }:
{
  hardware = {
    logitech.wireless.enable = true;

    cpu.intel.updateMicrocode = true;

    opengl = {
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
}
