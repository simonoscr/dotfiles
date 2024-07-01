{
  nix.settings = {
    trusted-substituters = [
      "https://cache.nixos.org?priority=10?trusted=1"
      "https://simonoscr.cachix.org?trusted=1"
      "https://hyprland.cachix.org?trusted=1"
      "https://nix-community.cachix.org?trusted=1"
      "https://yazi.cachix.org?trusted=1"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "simonoscr.cachix.org-1:pTFtYU3a9SXL+Fw6S3sZ8uk+Vd33Yoothd771oGNJBE="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
    ];
  };
}