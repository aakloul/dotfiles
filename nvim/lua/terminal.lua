require("toggleterm").setup({
    open_mapping = [[<c-\>]],
    -- size can be a number or function which is passed the current terminal
    -- size = 20 | function(term)
    --  if term.direction == "horizontal" then
    --    return 15
    --  elseif term.direction == "vertical" then
    --    return vim.o.columns * 0.4
    --  end
    --end,
    -- on_create = fun(t: Terminal), -- function to run when the terminal is first created
    -- on_open = fun(t: Terminal), -- function to run when the terminal opens
    -- on_close = fun(t: Terminal), -- function to run when the terminal closes
    -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback processing output on stdout
    -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback processing output on stderr
    -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function when terminal process exits
    hide_numbers = true,      -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    autochdir = false,        -- when neovim changes its current directory the terminal will do the same when opened
    shade_terminals = true,   -- NOTE: takes priority over highlights => if you specify Normal highlights set to false
    start_in_insert = true,
    insert_mappings = true,   -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true,      -- if set to true (default) the previous terminal mode will be remembered
    direction = "float",      -- 'vertical' | 'horizontal' | 'tab' | 'float',
    close_on_exit = true,     -- close the terminal window when the process exits
    -- Change the default shell. Can be a string or a function returning a string
    shell = _G.vim.o.shell,
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = "single", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        -- like `size`, width and height can be a number or function which is passed the current terminal
        -- width = <value>,
        -- height = <value>,
        winblend = 3,
        --zindex = <value>,
    },
    winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end,
    },
})

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) -- prevents exit lazygit
    _G.vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
    _G.vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    _G.vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    _G.vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    _G.vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    _G.vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
_G.vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local htop = Terminal:new({ cmd = "htop", hidden = true })
local python_interactive = Terminal:new({ cmd = "python", hidden = true })
local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _G.lazygit_toggle()
    lazygit:toggle()
end

function _G.htop_toggle()
    htop:toggle()
end

function _G.python_toggle()
    python_interactive:toggle()
end

function _G.ncdu_toggle()
    ncdu:toggle()
end

_G.vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua lazygit_toggle()<CR>", { noremap = true, silent = true })
_G.vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>lua htop_toggle()<CR>", { noremap = true, silent = true })
_G.vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua python_toggle()<CR>", { noremap = true, silent = true })
_G.vim.api.nvim_set_keymap("n", "<leader>nc", "<cmd>lua _NCDU_TOGGLE()<CR>", { noremap = true, silent = true })
