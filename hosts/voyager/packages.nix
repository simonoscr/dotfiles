{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    neofetch
    neovim
    btop
    bat
    curl
    dig
    nslookup
    # hypervisor
    qemu
  ];
}
