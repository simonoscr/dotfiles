# Compact installation Guide

## Manual Installation

### 1. Boot with Live USB

- Start interactive login shell as root user

```shell
sudo -i
```

- Change keyboard layout

```shell
loadkeys de
```

### 2. Partitioning and formatting (UEFI)

#### Partitioning

1. Create GPT partition table

```shell
parted /dev/yourdisk -- mklabel gpt
```

2. Add the boot partition. NixOS by default uses the ESP (EFI system partition) as its /boot partition.

```shell
parted /dev/yourdisk -- mkpart ESP fat32 1MB 512MB
parted /dev/yourdisk -- set 1 esp on
```

3. Create root partition

```shell
parted /dev/sda -- mkpart root ext4 512MB 100%
```

#### Formatting

1. Format boot partition

```shell
mkfs.fat -F 32 -n boot /dev/youBootPartition
```

2. Format root partition

```shell
mkfs.ext4 -L nixos /dev/youRootPartition
```

#### Mount

1. Mount root partition

```shell
mount /dev/disk/by-label/nixos /mnt
```

2. Mount boot partition

```shell
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
```


### 3. Generate default nixos configuration

1. Create config

```shell
nixos-generate-config --root /mnt
```

2. Edit config

```shell
nano /mnt/etc/nixos/configuration.nix
```

### 4. Install NixOS

```shell
nixos-install
```

nixos-install will ask you to set the password for the root user:

```shell
setting root password...
New password: ***
Retype new password: ***
```

### REBOOT

## DONE
