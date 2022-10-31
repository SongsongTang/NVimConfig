local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "saul.lsp.mason"
require("saul.lsp.handlers").setup()
require "saul.lsp.null-ls"
