local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
-- local sn = ls.snippet_node
--local d = ls.dynamic_node
--local r = require("luasnip.extras").rep

-- local function get_node_value(args)
--     return sn(nil, {
--         i(1, args[1]),
--     })
-- end

return {
    -- s("example_dhkqurvn", {
    --     t("src/"),
    --     i(1, "filename"),
    --     t(".py"),
    --     t({ "", "test/test_" }),
    --     d(2, get_node_value, { 1 }),
    --     t(".py"),
    --     t({ "", "test/__init__.py" }),
    --     t({ "", "pyproject.toml" }),
    -- }),
    s(
        "py_new_project",
        fmt(
            [[
        src/{a}__init__.py
        src/{a}{b}.py
        tests/test_{b}.py
        README.md
        pyproject.toml
        setup.py
        doc/
    ]],
            {
                a = c(1, { t("package/"), t("") }),
                b = i(2, "filename"),
            },
            { repeat_duplicates = true }
        )
    ),
    s(
        "py_new_pytest",
        fmt(
            [[
        src/{a}{b}.py
        tests/test_{b}.py
    ]],
            {
                a = c(1, { t("package/"), t("") }),
                b = i(2, "filename"),
            },
            { repeat_duplicates = true }
        )
    ),
}
