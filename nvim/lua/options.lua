-- Hint: use `:h <option>` to figure out the meaning if needed
_G.vim.opt.clipboard = "unnamedplus" -- use system clipboard
_G.vim.opt.completeopt = { "menu", "menuone", "noselect" }
_G.vim.opt.mouse = "a"               -- allow the mouse to be used in Nvim

-- Tab
_G.vim.opt.tabstop = 4      -- number of visual spaces per TAB
_G.vim.opt.softtabstop = 4  -- number of spacesin tab when editing
_G.vim.opt.shiftwidth = 4   -- insert 4 spaces on a tab
_G.vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config
_G.vim.opt.number = true         -- show absolute number
_G.vim.opt.relativenumber = true -- add numbers to each line on the left side
_G.vim.opt.cursorline = true     -- highlight cursor line underneath the cursor horizontally
_G.vim.opt.splitbelow = true     -- open new vertical split bottom
_G.vim.opt.splitright = true     -- open new horizontal splits right
_G.vim.opt.termguicolors = true  -- enabl 24-bit RGB color in the TUI
_G.vim.opt.showmode = false      -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
_G.vim.opt.incsearch = true  -- search as characters are entered
_G.vim.opt.hlsearch = false  -- do not highlight matches
_G.vim.opt.ignorecase = true -- ignore case in searches by default
_G.vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

-- Options to add `gf` functionality inside `.lua` files.
_G.vim.opt_local.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
_G.vim.opt_local.includeexpr = "substitute(v:fname,'\\.','/','g')"
for _, path in pairs(_G.vim.api.nvim_list_runtime_paths()) do
    _G.vim.opt_local.path:append(path .. '/lua')
end
_G.vim.opt_local.suffixesadd:prepend('.lua')
