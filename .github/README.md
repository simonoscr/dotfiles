# Henlo

<div align="center">

[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix%20Flakes&color=41439a)](https://builtwithnix.org) [![](https://img.shields.io/badge/NixOS-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8AADF4)](https://github.com/nixos/nixpkgs)

[![Release](https://github.com/simonoscr/dotfiles/actions/workflows/semver.yml/badge.svg)](https://github.com/simonoscr/dotfiles/actions/workflows/semver.yml) [![check nix flake](https://github.com/simonoscr/dotfiles/actions/workflows/test.yaml/badge.svg)](https://github.com/simonoscr/dotfiles/actions/workflows/test.yaml) [![update flake.lock](https://github.com/simonoscr/dotfiles/actions/workflows/updatelockfile.yml/badge.svg?event=schedule)](https://github.com/simonoscr/dotfiles/actions/workflows/updatelockfile.yml)

</div>

---

<br>
<p align="center">
  <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nixos-white.png" width="500px" alt="NixOS logo"/>
</p>
<br>

---

## :snowflake: Layout
```
.dotfiles/
├── common
│   └── default.nix
├── flake.lock
├── flake.nix
├── home
│   ├── simon
│   │   ├── home.nix
│   │   └── secrets
│   │       └── secrets.yaml
│   └── work
│       ├── home.nix
│       └── secrets
├── hosts
│   ├── cosmos
│   │   ├── audio.nix
│   │   ├── configuration.nix
│   │   ├── fonts.nix
│   │   ├── hardware-configuration.nix
│   │   ├── hardware.nix
│   │   ├── hyprland.nix
│   │   ├── locale.nix
│   │   ├── network.nix
│   │   ├── packages.nix
│   │   ├── services.nix
│   │   └── xserver.nix
│   └── voyager
│       └── configuration.nix
├── lib
│   ├── attrs.nix
│   ├── default.nix
│   ├── generators.nix
│   ├── modules.nix
│   ├── nixos.nix
│   ├── options.nix
│   └── paths.nix
├── modules
│   ├── ags
│   │   ├── default.nix
│   │   └── style1/
│   ├── alacritty.nix
│   ├── bash.nix
│   ├── browser.nix
│   ├── cli.nix
│   ├── fonts.nix
│   ├── foot.nix
│   ├── games.nix
│   ├── git.nix
│   ├── gtk.nix
│   ├── hyprland/
│   │   ├── config.nix
│   │   ├── default.nix
│   │   ├── swayidle.nix
│   │   └── swaylock.nix
│   ├── kitty.nix
│   ├── neovim.nix
│   ├── packages.nix
│   ├── sops.nix
│   ├── starship.nix
│   ├── vscodium.nix
│   ├── xdg.nix
│   ├── zathura.nix
│   └── zsh.nix
└── packages
```
