-- you can configure Hop the way you like here; see :h hop-config
local hop = require("hop")
hop.setup({
    keys = "asdfjkl;ghnmxcvbziowerutyqp",
    multi_windows = true,
})

-- place this in one of your configuration file(s)
local directions = require("hop.hint").HintDirection
_G.vim.keymap.set("", "f", function()
    --hop.hint_char1({ current_line_only = true })
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
_G.vim.keymap.set("", "F", function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
_G.vim.keymap.set("", "t", function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
_G.vim.keymap.set("", "T", function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

_G.vim.keymap.set("", "<leader>/", function()
    hop.hint_patterns({ current_line_only = false })
end, { remap = true })

_G.vim.keymap.set("", "s", function()
    hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })
_G.vim.keymap.set("", "S", function()
    hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap = true })
