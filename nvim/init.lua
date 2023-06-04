vim.g.python3_host_prog = "~/.pyenv/versions/neovim3/bin/python"
require("options")
require("mappings")
require("plugins")
require("linter") -- must be before lsp
require("file-explorer")
require("syntax-highlight")
require("statusbar")
require("fuzzy-finder")
require("lsp")
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
