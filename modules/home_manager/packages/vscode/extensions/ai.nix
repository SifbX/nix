{ pkgs, ... }: {
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    openai.chatgpt
  ];
}