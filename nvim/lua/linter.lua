require("mason-null-ls").setup({
    ensure_installed = {
        -- Opt to list sources here, when available in mason.
        "stylua",
        "jq",
        "prettier",
        "flake8",
        "black",
        "luacheck",
        "debugpy",
        "tflint",
    },
    automatic_installation = true,
    handlers = {},
})
require("null-ls").setup({
    sources = {
        -- Anything not supported by mason.
    },
    --diagnostics_format = "[#{c}] #{m} (#{s})",
    --root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".luacheckrc", ".git"),
})

local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = lsp_capabilities,
        })
    end,
})

--local get_servers = require('mason-lspconfig').get_installed_servers
--for _, server_name in ipairs(get_servers()) do
--  lspconfig[server_name].setup({
--    capabilities = lsp_capabilities,
--  })
--end
