{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = true;
    mutableExtensionsDir = true; # for better spontan extension installation
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      editorconfig.editorconfig
      pkief.material-icon-theme
      redhat.vscode-yaml
      redhat.ansible
      yzhang.markdown-all-in-one
      eamodio.gitlens
      christian-kohler.path-intellisense
      golang.go
      ms-kubernetes-tools.vscode-kubernetes-tools
    ];
    userSettings = {
      "update.mode" = "none";
      "files.autoSave" = "afterDelay";
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.startupEditor" = "none";
      "redhat.telemetry.enabled" = false;
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;
      "terminal.integrated.fontFamily" = "JetBrains Mono";
      "editor.fontFamily" = "'JetBrains Mono'";
      "editor.fontSize" = 15;
      "editor.fontLigatures" = true;
      "editor.fontVariations" = false;
      "github.gitProtocol" = "ssh";
      "git.alwaysShowStagedChangesResourceGroup" = true;
      "git.branchRandomName.dictionary" = [ "colors" ];
      "git.branchSortOrder" = "alphabetically";
      "git.defaultCloneDirectory" = "$HOME/code";
      "editor.tabSize" = 2;
      "git.rebaseWhenSync" = true;
      "direnv.restart.automatic" = true;
    };
  };
}
