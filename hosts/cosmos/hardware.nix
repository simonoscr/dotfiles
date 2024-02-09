{
  inputs,
  config,
  pkgs,
  ...
}: {
  environment.variables.AMD_VULKAN_ICD = "RADV";

  hardware = {
    bluetooth.enable = true;
    logitech.wireless.enable = true;

    cpu.amd.updateMicrocode = true;

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        goverlay
        mangohud
        vaapiVdpau
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs; [mangohud];
    };
  };
}
