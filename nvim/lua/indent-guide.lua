_G.vim.opt.list = true
_G.vim.opt.list = true
--_G.vim.opt.listchars:append "eol:↴"
_G.vim.opt.listchars:append "space:⋅"

_G.vim.opt.termguicolors = true
--_G.vim.cmd [[highlight IndentBlanklineIndent1 guibg=pMenu gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
}

-- require("indent_blankline").setup {
--     show_end_of_line = true,
-- }


-- require("indent_blankline").setup {
--     char = "",
--     char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--     },
--     space_char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--     },
--     show_trailing_blankline_indent = false,
--     show_end_of_line = false,
-- }
