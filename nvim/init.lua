_G.vim.g.python3_host_prog = "~/.pyenv/versions/neovim3/bin/python"
require("options")
require("mappings")
require("plugins") --must be before other plugins
require("linter")  -- must be before lsp
require("file-explorer")
require("oil").setup()
_G.vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
require("syntax-highlight")
require("statusbar")
require("fuzzy-finder")
require("code-completion")
require("snippets")
require("lsp")        -- must be after linter
require("lsp_lines_") -- must be after linter
require("debugger")
require("git")
require("terminal")
require("autopairs")
require("whichkey")
require("styling") --must be before bufferline
-- TODO: archive bufferline since we have replaced it with barbar
--require("bufferline_")  -- must be after styling
require("barbar_")
require("hoverdoc")
require("hop_")
require("todo-comments_")
require("colorizer")
require("Comment").setup()
require("refactoring_")
require("noice_")
