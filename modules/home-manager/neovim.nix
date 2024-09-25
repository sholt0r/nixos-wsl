{pkgs, lib, config, ...}: {
  
  options = {
    neovim.enable = lib.mkEnableOption "enables neovim";
  };

  config = lib.mkIf config.zsh.enable {
    programs.neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraLuaConfig = ''${builtins.readFile ./config/nvim/init.lua}''
    };
  }
}
