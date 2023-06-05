-- disable netrw at the very start of your init.lua (strongly advised)
_G.vim.g.loaded_netrw = 1
_G.vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
_G.vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
    -- open_on_setup = true,
    -- ignore_buffer_on_setup = true,
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
