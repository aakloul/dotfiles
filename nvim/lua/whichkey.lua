local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
    f = {
        name = "file", -- optional group name
        f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- additional options for creating the keymap
        n = { "New File" }, -- just a label. don't create any mapping
        e = "Edit File", -- same as above
        ["1"] = "which_key_ignore",  -- special label to hide it in the popup
        b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
    },
    d = {
        name = "test / debug",
        m = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" },
        M = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" },
        f = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
        F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" },
        S = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
    -- nvim-dap keymappings
        t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint"},
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue"},
        ['?'] = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<cr>", "Toggle Condition"},
        l = { "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<cr>", "Toggle Logpoint"},
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Step over"},
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Step into"},
        x = { "<cmd>lua require'dap'.step_out()<cr>", "Step out"},
 
    }
}, { prefix = "<leader>" })

