{ pkgs, lib, config, ... }: {
  options = {
    starship.enable = lib.mkEnableOption "enables starship";
  };

  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;

	format = "
	  [ ](colour_bg0)\
	  $os\
	  $username\
	  $hostname\
	  $directory\
	  $git_branch\
	  $git_status\
	  $c\
	  $rust\
	  $golang\
	  $nodejs\
	  $php\
	  $java\
	  $kotlin\
	  $haskell\
	  $python\
	  $docker_context\
	  $conda\
	  $character";

	palette = sholtor_dark;

	sholtor_dark = {
	  colour_bg0 = "#424242";
	  colour_fg0 = "#ffffff";
	  colour_fg1 = "#E64747";
	  colour_ubuntu = "#EB6536";
	  colour_ssh = "#43CCEA";
	  colour_folder = "#3EC669";
	  colour_lblue = "#43CCEA";
	  colour_python = "#E4F34A";
	  colour_go = "#7FD5EA";
	  colour_node = "#42E66C";
	  colour_ruby = "#E64747";
	  colour_java = "#E64747";
	  colour_julia = "#9B6BDF";
	  colour_php = "#4063D9";
	  colour_blue = "#458588";
	  colour_aqua = "#689d6a";
	  colour_green = "#98971a";
	  colour_orange = "#d65d0e";
	  colour_purple = "#b16286";
	  colour_red = "#cc241d";
	  colour_yellow = "#d79921";
	};

	os = {
	  disabled = false;
	  style = "bg:colour_bg0 fg:colour_blue";
	  symbols = {
	    Alpaquita = " ";
	    Alpine = " ";
	    AlmaLinux = " ";
	    Amazon = " ";
	    Android = " ";
	    Arch = " ";
	    Artix = " ";
	    CentOS = " ";
	    Debian = " ";
	    DragonFly = " ";
	    Emscripten = " ";
	    EndeavourOS = " ";
	    Fedora = " ";
	    FreeBSD = " ";
	    Garuda = "󰛓 ";
	    Gentoo = " ";
	    HardenedBSD = "󰞌 ";
	    Illumos = "󰈸 ";
	    Kali = " ";
	    Linux = " ";
	    Mabox = " ";
	    Macos = " ";
	    Manjaro = " ";
	    Mariner = " ";
	    MidnightBSD = " ";
	    Mint = " ";
	    NetBSD = " ";
	    NixOS = " ";
	    OpenBSD = "󰈺 ";
	    openSUSE = " ";
	    OracleLinux = "󰌷 ";
	    Pop = " ";
	    Raspbian = " ";
	    Redhat = " ";
	    RedHatEnterprise = " ";
	    RockyLinux = " ";
	    Redox = "󰀘 ";
	    Solus = "󰠳 ";
	    SUSE = " ";
	    Ubuntu = " ";
	    Unknown = " ";
	    Void = " ";
	    Windows = "󰍲 ";

	username = {
	  show_always = true;
	  style_user = "bg:colour_bg0 fg:colour_lblue bold";
	  style_root = "bg:colour_bg0 fg:colour_fg1 bold";
	  format = "[ $user]($style)";
	};

	hostname = {
	  ssh_only = false;
	  ssh_symbol = ":🌐";
	  trim_at = ".";
	  format = "[@$hostname$ssh_symbol]($style)";
	  style = "bg:colour_bg0 fg:colour_lblue";
	};

	directory = {
	  format = "[:$path]($style)";
	  style = "bg:colour_bg0 fg:colour_folder";
	  home_symbol = "~";
	  truncate_to_repo = false;
	  use_os_path_sep = true;
	};

	git_branch = {
	  symbol = "";
	  style = "bg:colour_bg0";
	  format = "[[ $symbol $branch ](fg:colour_lblue bg:colour_bg0)]($style)";
	};

	git_status = {
	  style = "bg:colour_bg0";
	  format = "[[($all_status$ahead_behind )](fg:colour_lblue bg:colour_bg0)]($style)";
	};

	nodejs = {
	  symbol = "";
	  style = "bg:colour_bg0";
	  format = "[[ $symbol( $version) ](fg:colour_node bg:colour_bg0)]($style)";
	};

	c = {
	  symbol = " ";
	  style = "bg:colour_bg0";
	  format = "[[ $symbol( $version) ](fg:colour_blue bg:colour_bg0)]($style)";
	};

[rust]
symbol = ""
style = "bg:colour_bg0"
format = "[[ $symbol( $version) ](fg:colour_blue bg:colour_bg0)]($style)"

[golang]
symbol = ""
style = "bg:colour_bg0"
format = "[[ $symbol( $version) ](fg:colour_go bg:colour_bg0)]($style)"

[php]
symbol = ""
style = "bg:colour_bg0"
format = "[[ $symbol( $version) ](fg:colour_php bg:colour_bg0)]($style)"

[java]
symbol = " "
style = "bg:colour_bg0"
format = "[[ $symbol( $version) ](fg:colour_java bg:colour_bg0)]($style)"

[kotlin]
symbol = ""
style = "bg:colour_bg0"
format = "[[ $symbol( $version) ](fg:colour_blue bg:colour_bg0)]($style)"

[haskell]
symbol = ""
style = "bg:colour_bg0"
format = "[[ $symbol( $version) ](fg:colour_blue bg:colour_bg0)]($style)"

[python]
symbol = ""
style = "bg:colour_bg0"
format = "[[ $symbol( $version) ](fg:colour_python bg:colour_bg0)]($style)"

[docker_context]
symbol = ""
style = "bg:colour_bg0"
format = "[[ $symbol( $context) ](fg:#83a598 bg:colour_bg0)]($style)"

[conda]
style = "bg:colour_bg0"
format = "[[ $symbol( $environment) ](fg:#83a598 bg:colour_bg0)]($style)"

[character]
disabled = false
success_symbol = "[ ❯](bg:colour_bg0 fg:colour_folder)[](fg:colour_bg0)"
error_symbol = "[ ❯](bg:colour_bg0 fg:colour_fg1)[](fg:colour_bg0)"
vimcmd_symbol = "[ ❮](bg:colour_bg0 fg:colour_folder)[](fg:colour_bg0)"
vimcmd_replace_one_symbol = "[ ❮](bg:colour_bg0 fg:purple)[](fg:colour_bg0)"
vimcmd_replace_symbol = "[ ❮](bg:colour_bg0 fg:purple)[](fg:colour_bg0)"
vimcmd_visual_symbol = "[ ❮](bg:colour_bg0 fg:yellow)[](fg:colour_bg0)"
      }
    }
  }
}
