return {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  root_markers = { '.eslintrc', '.eslintrc.js', '.eslintrc.json', 'package.json', '.git' },
  settings = {
    run = 'onType',
    nodePath = 'node',
    experimental = {
      useFlatConfig = true,
    },
    workingDirectory = { mode = 'auto' },
  },
}
