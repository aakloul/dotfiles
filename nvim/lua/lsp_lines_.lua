-- Disable virtual_text since it's redundant due to lsp_lines.
_G.vim.diagnostic.config({
    virtual_text = false,
})
require("lsp_lines").setup()
