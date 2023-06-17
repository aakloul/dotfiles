local ensure_packer = function()
    local fn = _G.vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        })
        _G.vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- Configurations will go here soon
    use("wbthomason/packer.nvim")
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {
                -- Optional
                "williamboman/mason.nvim",
                run = function()
                    pcall(_G.vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },     -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            -- Snippets compatible with lsp-zero
            {
                "L3MON4D3/LuaSnip",
                run = "make install_jsregexp", -- install jsregexp (optional!:).
                -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                -- tag = "v<CurrentMajor>.*",
            },                                  -- Required
            { "rafamadriz/friendly-snippets" }, -- for VSCode snippets via LuaSnip
            { "saadparwaiz1/cmp_luasnip" },     -- Required by L3MON4D3/LuaSnip
        },
    })
    use({ "molleweide/LuaSnip-snippets.nvim" }) --community snippets

    --use 'williamboman/mason.nvim'
    --use 'williamboman/mason-lspconfig.nvim'
    --use 'neovim/nvim-lspconfig'
    -- Lint / Formatters
    use("jay-babu/mason-null-ls.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    -- Dracula theme for styling
    use("Mofiqul/dracula.nvim")
    use({ "catppuccin/nvim", as = "catppuccin" })
    -- use("ellisonleao/gruvbox.nvim")
    -- Hrsh7th Code Completion Suite
    --use 'hrsh7th/nvim-cmp'
    --use 'hrsh7th/cmp-nvim-lsp'
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    --use 'hrsh7th/cmp-vsnip'
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-buffer")
    --use 'hrsh7th/vim-vsnip'
    -- File explorer tree
    use("nvim-tree/nvim-web-devicons") -- optional, for file icons
    use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })
    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })
    -- DAP for debugging
    use("mfussenegger/nvim-dap")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    use("jay-babu/mason-nvim-dap.nvim")
    use("mfussenegger/nvim-dap-python")
    use("nvim-neotest/neotest")
    use("nvim-neotest/neotest-python")
    -- TreeSitter
    -- recommended packer way of installing it is to run this function, copied from documentation
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        -- after = "nvim-treesitter",
        -- requires = "nvim-treesitter/nvim-treesitter",
    })
    --
    -- Refactoring
    use({
        "ThePrimeagen/refactoring.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    })

    -- Telescope used to fuzzy search files
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    -- Lualine information / Status bar
    use({
        "nvim-lualine/lualine.nvim",
        -- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })
    -- Auto Pair to generate brackets etc
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })
    -- Bufferline is a "header" with all opened buffers
    --use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons',
    --    -- config = function() require("bufferline").setup({}) end -- don't use if you want ot customize
    --}
    use({
        "romgrk/barbar.nvim",
        requires = {
            -- use 'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
            -- use 'lewis6991/gitsigns.nvim'      -- OPTIONAL: for git status
        },
        -- config = function() require("barbar").setup({}) end -- don't use if you want to customize
    })
    -- LSP Saga
    use({
        "glepnir/lspsaga.nvim",
        --opt = true,
        --branch = "main",
        --event = "LspAttach",
        config = function()
            require("lspsaga").setup({})
        end,
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" },
        },
    })

    -- Indent guide
    use("lukas-reineke/indent-blankline.nvim")
    -- Floatterm to run lazygit
    use("voldikss/vim-floaterm")
    -- git
    use({
        "lewis6991/gitsigns.nvim",
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    })
    -- toggleterm
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("toggleterm").setup()
        end,
    })
    use({
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
        --config = function() require 'hop'.setup { keys = 'asdfjkl;ghnmxcvbziowerutyqp' } end
    })
    use({
        "folke/which-key.nvim",
        config = function()
            _G.vim.o.timeout = true
            _G.vim.o.timeoutlen = 300
            --require("which-key").setup { }
        end,
    })
    use({ "folke/trouble.nvim", requires = { "nvim-tree/nvim-web-devicons" } })
    use({ "folke/todo-comments.nvim", requires = { "nvim-lua/plenary.nvim" } })

    -- Colors
    use({ "uga-rosa/ccc.nvim" })
    --use { 'brenoprata10/nvim-highlight-colors', setup = function() require('nvim-highlight-colors').setup {} end }
    --use { "rrethy/vim-hexokinase", run = "make", disable = true,
    --    -- TODO: try to have highlighter work
    --    -- setup = function() vim.g.Hexokinase_highlighters = { 'backgroundfull' } end
    --} -- golang installation is required

    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    })

    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    use({
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
