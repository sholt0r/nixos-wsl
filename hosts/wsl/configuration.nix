# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ pkgs, inputs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    inputs.home-manager.nixosModules.default
    inputs.nixos-wsl.nixosModules.default
  ];

  wsl = {
    enable = true;
    defaultUser = "jstaples";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = [
    pkgs.clang
    pkgs.curl
    pkgs.dig
    pkgs.eza
    pkgs.gcc
    pkgs.git
    pkgs.git-filter-repo
    pkgs.go
    pkgs.gnumake
    pkgs.neovim
    pkgs.nix-search-cli
    pkgs.nixfmt-rfc-style
    pkgs.openssl
    pkgs.python3
    pkgs.ruby
    pkgs.rustup
    pkgs.starship
    pkgs.powershell
    pkgs.stow
    pkgs.tmux
    pkgs.tshark
    pkgs.unzip
    pkgs.wget2
    pkgs.whois
    pkgs.wslu
    pkgs.zsh
    pkgs.zsh-autosuggestions
  ];

  nixos-wsl = {
    system.stateVersion = "24.05";
    wsl.enable = true;
  };

  users.users.jstaples = {
    isNormalUser = true;
    home = "/home/jstaples";
    description = "John Staples";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.jstaples = import ./home.nix;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.zsh = {
    enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
