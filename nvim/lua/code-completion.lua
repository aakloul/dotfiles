-- completeopt is used to manage code suggestions
-- menuone: show popup even when there is only one suggestion
-- noinsert: Only insert text when selection is confirmed
-- noselect: force us to select one from the suggestions
_G.vim.opt.completeopt = { "menuone", "noselect", "noinsert", "preview" }
-- shortmess is used to avoid excessive messages
_G.vim.opt.shortmess = _G.vim.opt.shortmess + { c = true }

-- Set up nvim-cmp.
local cmp = require("cmp")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            --_G.vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    --
    -- -- Add mapping keyboard shortcuts similar to VS code
    mapping = cmp.mapping.preset.insert({
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Shift+TAB to go to the Previous Suggested item
        ["<Tab>"] = cmp.mapping.select_next_item(),   -- Tab to go to the next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),      --scroll backward
        ["<C-f>"] = cmp.mapping.scroll_docs(4),       --scroll  forward
        ["<C-Space>"] = cmp.mapping.complete(),       --bring up completion at current Cursor location
        ["<C-e>"] = cmp.mapping.abort(),              -- CTRL+e to exit suggestion and close it
        -- CR (enter or return) to CONFIRM the currently selection suggestion
        -- We set the ConfirmBehavior to insert the Selected suggestion
        ["<CR>"] = cmp.mapping.confirm({
            -- behavior = cmp.ConfirmBehavior.Insert,
            select = true, --`false` to only confirm explicitly selected items.
        }),
    }),

    --
    -- -- installed sources that can be used for code suggestions
    sources = cmp.config.sources(
        {
            { name = "nvim_lsp" },
            -- { name = 'vsnip' }, -- For vsnip users.
            { name = "luasnip",                option = { show_autosnippets = true } }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
            { name = "nvim_lsp_signature_help" },
            { name = "buffer" },
            { name = "path" },
        },
        { { name = "buffer" } },
        -- { { name = 'nvim_lsp_signature_help' }, },
        { { name = "path" } }
    ),

    --
    -- -- add borders to the windows
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    --
    -- -- add formating of the different sources
    formatting = {
        fields = { "menu", "abbr", "kind" },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = "λ",
                vsnip = "⋗",
                buffer = "b",
                path = "p",
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
    --
    -- End of Configuration
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--         -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
--         { name = 'git' },
--     }, {
--         { name = 'buffer' },
--     })
-- })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--         { name = 'buffer' }
--     }
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = 'path' }
--     }, {
--         { name = 'cmdline' }
--     })
-- })

-- -- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
-- }
