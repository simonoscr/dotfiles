{pkgs, ...}: {
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 5;
    memoryPercent = 20;
  };
}
