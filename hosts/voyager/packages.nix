{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    neofetch
    neovim
    btop
    bat
    curl
    # hypervisor
    qemu
  ];
}
