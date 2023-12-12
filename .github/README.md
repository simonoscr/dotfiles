# Henlo

<div align="center">

[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix%20Flakes&color=41439a)](https://builtwithnix.org) [![](https://img.shields.io/badge/NixOS-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8AADF4)](https://github.com/nixos/nixpkgs)

[![Nix Flake Check](https://github.com/simonoscr/dotfiles/actions/workflows/nixflakecheck.yml/badge.svg?branch=main)](https://github.com/simonoscr/dotfiles/actions/workflows/nixflakecheck.yml)

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
├── flake.lock
├── flake.nix
├── home/
│   ├── simon/
│   │   ├── home.nix
│   │   └── secrets/
│   │       └── secrets.yaml
│   └── work/
│       ├── home.nix
│       └── secrets/
├── hosts/
│   └── nixos/
│       ├── audio.nix
│       ├── configuration.nix
│       ├── hardware-configuration.nix
│       ├── hyprland.nix
│       └── locale.nix
├── modules/
│   ├── ags/
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
└   └── zsh.nix
```
