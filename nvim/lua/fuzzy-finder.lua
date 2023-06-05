-- search files, even hidden ones
_G.vim.keymap.set(
    "n",
    "<leader>ff",
    ':lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>',
    {}
)
-- ripgrep files, respects gitignore
_G.vim.keymap.set("n", "<leader>fg", ':lua require"telescope.builtin".live_grep()<CR>', {})
