vim.opt.termguicolors = true -- enabl 24-bit RGB color in the TUI
bufferline = require("bufferline")
bufferline.setup({
    --bufferline.setup({
    highlights = {
        fill = {
            guibg = '#FF00FF',
        },
        indicator_selected = { sp = "#eb6f92" },
        --separator_selected = {
        --    fg = 'pMenu',
        --    bg = 'pMenu'
        --},
    },
    options = {
        mode = "buffers",
        style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.default,
        themable = true,
        indicator = {
            icon = '▎',  -- this should be omitted if indicator style is not 'icon'
            style = 'icon' --'icon' | 'underline' | 'none',
        },
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true
            }
        },
        separator_style = "slope", --{ "▎", "▎" }, --"thin" --slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        diagnostics = 'nvim-lsp',  --false
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end,
    },
})
fwjfn
--print(vim.inspect(require("bufferline").conf))
