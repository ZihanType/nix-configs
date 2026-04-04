{
  pkgs,
  ...
}:
let
  inherit (pkgs.nix4vscode) forVscodeExtVersion;

  decorators = {
    # "rust-lang.rust-analyzer" =
    #   {
    #     pkgs,
    #     lib,
    #     system,
    #   }:
    #   {
    #     # Dynamic decorator using function
    #     buildInputs = [ pkgs.rust-analyzer ];
    #   };
  };

  editor = "code --wait";
in
{
  home.sessionVariables = {
    EDITOR = editor;
    GIT_EDITOR = editor;
  };

  programs.vscode = {
    enable = false;
    package = pkgs.vscode;
    profiles = {
      default = {
        enableExtensionUpdateCheck = false;
        enableUpdateCheck = false;
        userMcp = builtins.fromJSON (builtins.readFile ./vscode/mcp.json);
        userSettings = builtins.fromJSON (builtins.readFile ./vscode/settings.json);
        extensions = forVscodeExtVersion decorators pkgs.vscode.version [
          "astral-sh.ty"
          "bradlc.vscode-tailwindcss"
          "dbaeumer.vscode-eslint"
          "dioxuslabs.dioxus"
          "esbenp.prettier-vscode"
          "fill-labs.dependi"
          "github.copilot-chat"
          "gruntfuggly.todo-tree"
          "huizhou.githd"
          "jnoortheen.nix-ide"
          "llvm-vs-code-extensions.lldb-dap"
          "ms-ceintl.vscode-language-pack-zh-hans"
          "ms-python.debugpy"
          "ms-python.python"
          "ms-python.vscode-pylance"
          "ms-python.vscode-python-envs"
          "ms-vscode-remote.remote-ssh"
          "ms-vscode-remote.remote-ssh-edit"
          "ms-vscode.remote-explorer"
          "ms-vscode.vscode-speech"
          "ms-vscode.vscode-speech-language-pack-zh-cn"
          "oxc.oxc-vscode"
          "pbkit.vscode-pbkit"
          "pkief.material-icon-theme"
          "rust-lang.rust-analyzer"
          "sst-dev.opencode"
          "tamasfe.even-better-toml"
          "tauri-apps.tauri-vscode"
          "thinker.sort-json"
          "usernamehw.errorlens"
          "vadimcn.vscode-lldb"
          "vue.volar"
          "yzhang.markdown-all-in-one"
        ];
      };
    };
  };
}
