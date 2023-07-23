local lsp = require("lsp-zero").preset({})

--vim.lsp.set_log_level("debug")

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()

    --    lsp.settings.Lua.diagnostics.globals = { "vim" }
end)

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
-- lsp.setup_servers({'tsserver', 'eslint'})

lsp.ensure_installed({
    "pyright",
    "gopls",
    "lua_ls",
    "terraformls",
    "rust_analyzer",
})

-- below replace -- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format({timeout_ms = 5000})]])
lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ["lua_ls"] = { "lua" },
        ["terraformls"] = { "terraform" },
        ["rust_analyzer"] = { "rust" },
    },
})

require("lsp.pyright")
require("lsp.gopls")
require("lsp.lua_ls")

lsp.setup()
