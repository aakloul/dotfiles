_G.vim.g.python3_host_prog = "~/.pyenv/versions/neovim3/bin/python"
require("options")
require("mappings")
require("plugins") --must be before other plugins
require("linter")  -- must be before lsp
require("file-explorer")
require("syntax-highlight")
require("statusbar")
require("fuzzy-finder")
require("lsp") -- must be after linter
require("code-completion")
require("debugger")
require("git")
require("terminal")
require("autopairs")
require("whichkey")
require("styling") --must be before buffer
--require("bufferline_")  -- must be after styling
require("barbar_")
require("hoverdoc")
require("hop_")
-- TODO: archive bufferline since we have replaced it with barbar
require("todo-comments_")
require("colorizer")

-- Disable virtual_text since it's redundant due to lsp_lines.
_G.vim.diagnostic.config({
    virtual_text = false,
})
require("lsp_lines").setup()
