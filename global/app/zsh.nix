{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableFastSyntaxHighlighting = true;
  };

  environment.etc."zshenv".text = ''
    if [ -n "''${XDG_CONFIG_HOME:-}" ]; then
      source "$XDG_CONFIG_HOME/zsh/.zshenv"
    else
      source "$HOME/.zshenv"
    fi
  '';
}
