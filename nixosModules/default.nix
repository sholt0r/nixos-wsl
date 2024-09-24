{ pkgs, lib, ... }: {
  imports = [
    ./services/home-manager.nix
    ./programs/zsh.nix
  ]
};
