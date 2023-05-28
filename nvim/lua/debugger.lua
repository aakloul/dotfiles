-- fetch the dap and dap-ui plugins
local dap = require('dap')
local dapui = require('dapui')
dapui.setup()

require("mason-nvim-dap").setup({
    ensure_installed = { "pyright", "delve", "golps" }
})

-- dap fires events, we can listen on them to open UI on certain events
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- Add adapter to delve
dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = {'dap', '-l', '127.0.0.1:${port}'},
    }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
    {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}"
    },
    -- works with go.mod packages and sub packages 
    {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    } 
}

require('dap-python').setup('~/.pyenv/versions/debugpy/bin/python')
dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = "${file}",
        pythonPath = function ()
            return vim.fn.expand('~/.pyenv/versions/debugpy/bin/python')
        end,
    },
}

