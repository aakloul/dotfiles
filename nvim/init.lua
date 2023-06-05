_G.vim.g.python3_host_prog = "~/.pyenv/versions/neovim3/bin/python"
require("options")
require("mappings")
require("plugins") --must be before other plugins
require("linter")  -- must be before lsp
require("file-explorer")
require("syntax-highlight")
require("statusbar")
require("fuzzy-finder")
require("lsp")        -- must be after linter
require("lsp_lines_") -- must be after linter
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
require('Comment').setup()

-- Options to add `gf` functionality inside `.lua` files.
_G.vim.opt_local.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
_G.vim.opt_local.includeexpr = "substitute(v:fname,'\\.','/','g')"
for _, path in pairs(_G.vim.api.nvim_list_runtime_paths()) do
    _G.vim.opt_local.path:append(path .. '/lua')
end
_G.vim.opt_local.suffixesadd:prepend('.lua')
