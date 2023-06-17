require("refactoring").setup({
    prompt_func_return_type = {
        go = true,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
    },
    prompt_func_param_type = {
        go = true,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
})

-- Remaps for the refactoring operations currently offered by the plugin
_G.vim.api.nvim_set_keymap(
    "v",
    "<leader>re",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    { noremap = true, silent = true, expr = false }
)
_G.vim.api.nvim_set_keymap(
    "v",
    "<leader>rf",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    { noremap = true, silent = true, expr = false }
)
_G.vim.api.nvim_set_keymap(
    "v",
    "<leader>rv",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)
_G.vim.api.nvim_set_keymap(
    "v",
    "<leader>ri",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)

-- Extract block doesn't need visual mode
_G.vim.api.nvim_set_keymap(
    "n",
    "<leader>rb",
    [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
    { noremap = true, silent = true, expr = false }
)
_G.vim.api.nvim_set_keymap(
    "n",
    "<leader>rbf",
    [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
    { noremap = true, silent = true, expr = false }
)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
_G.vim.api.nvim_set_keymap(
    "n",
    "<leader>ri",
    [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)
