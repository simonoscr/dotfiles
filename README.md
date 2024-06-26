#

<div align="center">

[![built with nix-flake](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix%20Flakes&color=41439a)](https://builtwithnix.org) [![NixOS unstable](https://img.shields.io/badge/NixOS-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8AADF4)](https://github.com/nixos/nixpkgs)

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit) [![pipeline status](https://gitlab.com/simonoscr/nixfiles/badges/main/pipeline.svg)](https://gitlab.com/simonoscr/nixfiles/-/commits/main)
[![Latest Release](https://gitlab.com/simonoscr/nixfiles/-/badges/release.svg)](https://gitlab.com/simonoscr/nixfiles/-/releases)

---

<br>
  <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nixos-white.png" width="500px" alt="NixOS logo"/>
<br>

</div>

---

<div align="center">

## Intro

</div>

Hello and welcome to my NixOS setup. Please be aware that I'm still in the early stages of learning all this. The setup here was created with the help of multiple examples and inspiration from other dotfile and nix-config repositories (see [Credits](https://gitlab.com/simonoscr/nixfiles#credits)).

Feel free to borrow ideas from my configurations, but keep in mind that they might not always represent the best or most correct approach and make sure you've grasped the basics of NixOS, Nix, Flakes, and Home-Manager.

> [!IMPORTANT]
> This repository is a work in progress, and I'm constantly learning more about NixOS, Nix, Flakes, and Home-Manager.

<div align="center">

## :snowflake: System Components

|                         | NixOS - Wayland | NixOS - Xorg    |
| ----------------------- | --------------- | --------------- |
| Display Manager         | greetd/tuigreet | greetd/tuigreet |
| Window Manager          | Hyprland        | i3              |
| Bar                     | Ags             | i3status        |
| Terminal                | Kitty           | Kitty           |
| Shell                   | zsh + Starship  | zsh + Starship  |
| Text Editor             | Nixvim(Neovim)  | Nixvim(Neovim)  |
| Code Editor             | VSCodium/Zed    | VSCodium/Zed    |
| System resource monitor | btop            | btop            |


## Systems

|           | MainPC - NixOS        | Server - NixOS                   |
| --------- | --------------------- | -------------------------------- |
| Name      | Desktop               | Server                           |
| CPU       | AMD Ryzen 7 7800X3D   | Intel® Processor Alder Lake-N100 |
| GPU       | AMD Radeon RX 7800 XT | Intel UHD Graphics               |
| RAM       | 32GB DDR5-6000        | 16GB DDR4-3200                   |
| Mainboard | MSI MAG B650 Tomahawk | shit                             |
| SSD       | 2TB NVMe              | 500GB NVMe                       |

</div>

<div align="center">

## Features

</div>

* [**nix-flake**](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html): Manage NixOS and Home-Manager configurations.

* [**flake-parts**](https://github.com/hercules-ci/flake-parts): A good way to manage flake with less boilerplate.

* [**home-manager**](https://github.com/nix-community/home-manager): Manage your dotfiles, home environment, and user-specific configurations with Home Manager.

* [**nh**](https://github.com/viperML/nh): "yet-another-nix-helper". `nh` reimplements some basic nix commands. Adding functionality on top of the existing solutions, like nixos-rebuild, home-manager cli or nix itself.

- [**NixVim**](https://www.startpage.com/do/dsearch?query=nixvim+github): Nix Flake Neovim

<div align="center">

## :snowflake: Repo Layout

</div>

* [**wiki**](https://gitlab.com/simonoscr/nixfiles/-/wikis/home)

* [**home**](https://gitlab.com/simonoscr/nixfiles/-/tree/main/home): This folder contains configurations for home-manager. In the profiles subfolder are the differenct home-manager profiles. Here i have everything user related in it.

* [**hosts**](https://gitlab.com/simonoscr/nixfiles/-/tree/main/hosts?ref_type=heads): The hosts/ folder helps me organize my different hosts. At the moment there are two hosts: My Desktop PC and my Home-Server.

* [**system**](https://gitlab.com/simonoscr/nixfiles/-/tree/main/system?ref_type=heads): This folder contains everything thats is nixos related. Like program, service, network and nix configuration itself. Like the counterpart of the home/ folder for system-wide things.

<div align="center">

## Search

</div>

* [NixOS Search](https://search.nixos.org) - Search for Nix packages, NixOS options or Flakes
  * [Options Search](https://search.nixos.org/options)
  * [Packages Search](https://search.nixos.org/packages)
  * [Flakes Search](https://search.nixos.org/flakes)
* [Home-Manager Options](https://mipmip.github.io/home-manager-option-search/) - Search for Home-Manager options
* [Nixhub.io](https://www.nixhub.io/) - Search Versions of nix packages
* [Noogle.dev](https://noogle.dev/) - Noogle is a Nix API search engine. It lets you search nix functions.
* [Hound](https://search.nix.gsc.io/) - Search things
* [nixpkgs PR-Tracker](https://nixpk.gs/pr-tracker.html)

<div align="center">

## Guides

</div>

* [NixOS Wiki](https://nixos.wiki/)
  * [NixOS Installation Guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)
  * [Nix Installation Guide](https://nixos.wiki/wiki/Nix_Installation_Guide)
  * [Nix Flake Installation Guide](https://nixos.wiki/wiki/Flakes)
* [Cachix Docs](https://docs.cachix.org/)

<div align="center">

## Credits

</div>

My repository is inspired by a diverse range of dotfiles and nix-configurations repositories across GitHub, GitLab (and maybe Codeberg). While I've gathered ideas from numerous places, there are a few key repositories that significantly influenced this repository:

* [fufexan Dotfiles](https://github.com/fufexan/dotfiles)
  * helped me very much to find a good repository structure and also good and clean .nix configurations and i learned from his repos how to build with nix
* [Matt Dotfiles](https://gitlab.com/usmcamp0811/dotfiles)
  * also borrowed a little structure and content of .nix files
* [ryan4yin nix-config](https://github.com/ryan4yin/nix-config)
  * helped me a lot for server related configurations
* [Aylur dotfiles](https://github.com/Aylur/dotfiles)
  * thank you very much for ags config
