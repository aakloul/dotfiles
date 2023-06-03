-- fetch keymap
local map = vim.api.nvim_set_keymap

-- update leader key to ,
vim.g.mapleader = " "

-- nvim-tree keymappings
-- map the key n to run the command :NvimTreeToggle
-- map('n', 'n', [[:NvimTreeToggle<CR>]], {})

-- nvim-dapui keymappings
-- Press Ctrl+d to toggle debug mode, will remove NvimTree also
map("n", "<C-d>", [[:NvimTreeClose<CR> :lua require'dapui'.toggle()<CR>]], {})
--map('n', '<C-d>', [[:NvimTreeToggle<CR> :lua require'dapui'.toggle()<CR>]], {})
-- Press F6 to open REPL
map("n", "<F6>", [[:lua require'dap'.repl.open()<CR>]], {})
-- Press dl to run last ran configuration (if you used f5 before it will re run it etc)
map("n", "dl", [[:lua require'dap'.run_last()<CR>]], {})

-- define common options
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- delta: 2 lines
-- vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
-- vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
-- vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
-- vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
