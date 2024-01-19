{
  pkgs,
  config,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    neofetch
    neovim
    linuxPackages.cpupower
    btop
    bat
    curl
    corectrl
    # hypervisor
    qemu
  ];
}
