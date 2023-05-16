-- Require LSP config which we can use to attach gopls
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local path = util.path

vim.lsp.set_log_level("debug")

-- Since we installed lspconfig and imported it, we can reach
-- gopls by lspconfig.gopls
-- we can then set it up using the setup and insert the needed configurations
lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
        },
    },
}


local function get_python_path(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
      return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
    end

    -- Find and use virtualenv in workspace directory.
    for _, pattern in ipairs({'*', '.*'}) do
        local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
        if match ~= '' then
            return path.join(path.dirname(match), 'bin', 'python')
        end
    end

    -- Fallback to system Python.
    return exepath('python') or exepath('python3') or 'python'
end

local python_root_files = {
    'pyrightconfig.json',
    '.python-version',
    'setup.py',
    'requirements.txt',
    'pyproject.toml',
    '.venv',
    'venv',
    'setup.cfg',
    'tox.ini',
    'Pipfile',
}

local root_dir = util.root_pattern(unpack(python_root_files))

lspconfig.pyright.setup {
    before_init = function(_, config)
        config.settings.python.pythonPath = get_python_path(root_dir)
    end,
    -- on_attach = py_on_attach,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = root_dir, 
    single_file_support = true,
    settings = {
        -- pyright = { disableLanguageServices = false, disableOrganizeImports = true },
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        }
    }
}

-- lspconfig.pylyzer.setup {
--     cmd = { "pylyzer", "--server" },
--     filetypes = { "python" },
--     root_dir = function(fname)
--         local root_files = {
--             'setup.py',
--             'tox.ini',
--             'requirements.txt',
--             'Pipfile',
--             'pyproject.toml',
--         }
--         return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or require('lspconfig.server_configurations.pylyzer').default_config.root_dir(fname)  or vim.fn.getcwd()
--     end,
--     settings = {
--         python = {
--             checkOnType = false,
--             diagnostics = true,
--             inlayHints = true,
--             smartCompletion = true
--         }
--     }
-- }
