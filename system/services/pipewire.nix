{
  lib,
  pkgs,
  ...
}: let
  q = 64;
  r = 44100;
  qr = "64/44100";
in {
  sound.enable = true;
  hardware.pulseaudio.enable = lib.mkForce false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;

    extraConfig.pipewire = {
      "99-low-latency" = {
        context = {
          properties.default.clock = {
            rate = r;
            allowed-rates = [r];
            quantum = q;
            min-quantum = q;
            max-quantum = q;
          };
          modules = [
            {
              name = "libpipewire-module-rtkit";
              flags = ["ifexists" "nofail"];
              args = {
                nice.level = -15;
                rt = {
                  prio = 88;
                  time.soft = 200000;
                  time.hard = 200000;
                };
              };
            }
            {
              name = "libpipewire-module-protocol-pulse";
              args = {
                server.address = ["unix:native"];
                pulse.min = {
                  req = qr;
                  quantum = qr;
                  frag = qr;
                };
              };
            }
          ];
          stream.properties = {
            node.latency = qr;
            resample.quality = 1;
          };
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
    playerctl
    pamixer
  ];
}
