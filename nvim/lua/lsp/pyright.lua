local lsp = require("lsp-zero")
local util = require("lspconfig/util")
local path = util.path


local python_root_files = {
    "pyrightconfig.json",
    ".python-version",
    "setup.py",
    "requirements.txt",
    "pyproject.toml",
    ".venv",
    "venv",
    "setup.cfg",
    "tox.ini",
    "Pipfile",
}

local root_dir = util.root_pattern(unpack(python_root_files))


local function get_python_path(workspace)
    -- Use activated virtualenv.
    if _G.vim.env.VIRTUAL_ENV then
        return path.join(_G.vim.env.VIRTUAL_ENV, "bin", "python")
    end

    -- Find and use virtualenv in workspace directory.
    for _, pattern in ipairs({ "*", ".*" }) do
        local match = _G.vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
        if match ~= "" then
            return path.join(path.dirname(match), "bin", "python")
        end
    end

    -- Fallback to system Python.
    return _G.vim.fn.exepath("python") or _G.vim.fn.exepath("python3") or "python"
end

--print(get_python_path(root_dir))

lsp.use('pyright', {
    single_file_support = true,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
            pythonPath = get_python_path(root_dir),
        },
    }
})

--lsp.use("pyright", {
--    --before_init = function(_, config)
--    --    config.settings.python.pythonPath = get_python_path(root_dir)
--    --end,
--    -- on_attach = py_on_attach,
--    --cmd = { "pyright-langserver", "--stdio" },
--    cmd = { _G.vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver", "--stdio" },
--    filetypes = { "python" },
--    root_dir = root_dir,
--    single_file_support = true,
--    settings = {
--        python = {
--            analysis = {
--                extraPaths = {
--                    get_python_path(root_dir),
--                    "/Users/adel.akloul/.pyenv/versions/sage/lib/python3.11/site-packages/sagemaker",
--                    "/Users/adel.akloul/.pyenv/versions/sage/lib/python3.11/site-packages/",
--                    "/Users/adel.akloul/.pyenv/versions/sage/lib/",
--                },
--                autoSearchPaths = true,
--                diagnosticMode = "workspace",
--                useLibraryCodeForTypes = true,
--            },
--            venvPath = "/Users/adel.akloul/.pyenv/versions/",
--            pythonPath = get_python_path(root_dir)
--            --pythonPath = "/Users/adel.akloul/.pyenv/versions/sage/lib/python3.11/site-packages"
--        },
--    },
--})

--lsp.configure("pyright", {
--    before_init = function(_, config)
--        config.settings.python.pythonPath = get_python_path(root_dir)
--    end,
--    -- on_attach = py_on_attach,
--    --cmd = { "pyright-langserver", "--stdio" },
--    cmd = { _G.vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver", "--stdio" },
--    filetypes = { "python" },
--    root_dir = root_dir,
--    single_file_support = true,
--    settings = {
--        python = {
--            analysis = {
--                -- extraPaths = { get_python_path(root_dir) },
--                extraPaths = {
--                    get_python_path(root_dir),
--                    "/Users/adel.akloul/.pyenv/versions/sage/lib/python3.11/site-packages/sagemaker"
--                },
--                autoSearchPaths = true,
--                diagnosticMode = "workspace",
--                useLibraryCodeForTypes = true,
--            },
--            pythonPath = get_python_path(root_dir)
--        },
--    },
--})
