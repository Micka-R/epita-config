{ pkgs, ... }:

{
  programs.neovim = {
    extraConfig =
    ''
        indent_type = "Spaces"
	indent_width = 4
	column_width = 120
    '';
  };
}