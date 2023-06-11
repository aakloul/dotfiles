local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
    s("pyproject",
        {
            t({ "[tool.pytest.ini_options]" }),
            t({ "", "pythonpath = \"src\"" }),
            t({ "", "addopts = [" }),
            t({ "", "\t\"--import-mode=importlib\"," }),
            t({ "", "]" })
        }
    )
}
