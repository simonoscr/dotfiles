{
  nix.settings = {
    substituters = [
      "https://cache.nixos.org?priority=10"
      "https://simonoscr.cachix.org"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "simonoscr.cachix.org-1:pTFtYU3a9SXL+Fw6S3sZ8uk+Vd33Yoothd771oGNJBE="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
