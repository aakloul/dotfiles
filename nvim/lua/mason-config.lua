require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    -- FULL list at https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md 
    -- ensure_installed = { 'pylsp','pyright', 'pylyzer', 'gopls', 'lua_ls', 'rust_analyzer' },
    ensure_installed = { 'pyright', 'gopls', 'lua_ls', 'rust_analyzer' },
})

