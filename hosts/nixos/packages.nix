{ pkgs, config, lib, ... }:
{

  environment.systemPackages = with pkgs; [
    git
    neovim
    linuxPackages.cpupower
    btop
    bat
    curl
  ];
}
