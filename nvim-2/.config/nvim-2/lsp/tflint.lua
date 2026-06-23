return {
  cmd = { 'tflint', '--langserver' },
  filetypes = { 'terraform', 'tf' },
  root_markers = { '.tflint.hcl', '.terraform', '.git' },
}
