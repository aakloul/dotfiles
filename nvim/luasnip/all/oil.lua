local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node
--local r = require("luasnip.extras").rep

local function get_node_value(args)
    -- the returned snippetNode doesn't need a position; it's inserted
    -- "inside" the dynamicNode.
    return sn(nil, {
        -- jump-indices are local to each snippetNode, so restart at 1.
        i(1, args[1]),
    })
end

return {
    s("py_project", {
        t("src/"), i(1, "filename"), t(".py"),
        t({ "", "test/test_" }), d(2, get_node_value, { 1 }), t(".py"),
        t({ "", "test/__init__.py" }),
        t({ "", "pyproject.toml" }),
    }),
}
