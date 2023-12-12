{ pkgs, ... }:
let
  aliases = {
    "cls" = "clear";

    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";

    "ll" = "ls -lah -color";
    "la" = "ls -A -color";

    "myip" = "curl http://ipecho.net/plain; echo";

    "code" = "codium";

    "grep" = "grep --color";

  };

in {

  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      autocd = true;
      syntaxHighlighting.enable = true;
      dirHashes = {
        dl = "$HOME/Downloads";
	      docs = "$HOME/Documents";
	      pics = "$HOME/Pictures";
	      vids = "$HOME/Videos";
      };

      initExtra = ''
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
        zstyle ':completion:*' menu select
	      zstyle ':completion:*' verbose true
	      zstyle ':completion:*' completer _complete _ignored _approximate
      '';
      shellAliases = aliases;
    };
  };
}
