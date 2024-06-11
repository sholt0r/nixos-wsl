# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = "jstaples";

  environment.systemPackages = [
    pkgs.ansible
    pkgs.bfg-repo-cleaner
    pkgs.clang
    pkgs.curl
    pkgs.dig
    pkgs.eza
    pkgs.gcc
    pkgs.gh
    pkgs.git
    pkgs.git-filter-repo
    pkgs.go
    pkgs.neovim
    pkgs.nix-search-cli
    pkgs.nodejs_22
    pkgs.openssl
    pkgs.python3
    pkgs.rustup
    pkgs.starship
    pkgs.stow
    pkgs.tmux
    pkgs.tshark
    pkgs.unzip
    pkgs.wget2
    pkgs.whois
    pkgs.wslu
    pkgs.zig
    pkgs.zsh
  ];

  users.users.jstaples = {
    isNormalUser = true;
    home = "/home/jstaples";
    description = "John Staples";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
