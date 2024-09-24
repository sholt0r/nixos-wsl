{ pkgs, lib, config, ... }: {

  options = {
    zsh.enable = lib.mkEnableOption "enables zsh";
  };

  config = lib.mkIf config.zsh.enable {
    
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      interactiveShellInit = ''
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      '';

      envExtra = {
        BROWSER = "wslview";
        XDG_CONFIG_HOME = "~/.config/";
        XDG_DATA_HOME = "~/.local/data";
        ZVM_VI_EDITOR = "nvim";
      };

      shellAliases = {
        ls = "eza";
        nixos-rebuild = "sudo nixos-rebuild";
      };

      history = {
        size = 100000;
        path = "~/.local/zsh/history";
      };

    };

  };

}
