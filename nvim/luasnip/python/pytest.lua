local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local f = ls.function_node

local function get_node_value(args)
    -- the returned snippetNode doesn't need a position; it's inserted
    -- "inside" the dynamicNode.
    return sn(nil, {
        -- jump-indices are local to each snippetNode, so restart at 1.
        i(1, args[1]),
    })
end

local function fn_arguments(args)
    local idx = string.find(args[1][1], ", expected", 0)
    args = { string.sub(args[1][1], 0, idx - 1) }
    print(args)
    return get_node_value(args)
end

local function arguments_choice(ilevel)
    return c(ilevel, { t(""), t("arg1"), t("arg1, arg2"), t("arg1, arg2, arg3") })
end

return {
    s("@pytest_parametrize", {
        t('@pytest.mark.parametrize("'),
        c(1, { t("given, expected"), t("entry1, entry2, expected") }),
        t('", ['),
        t("", "\t["),
        t({ "", "\t(" }),
        d(2, get_node_value, { 1 }),
        t("),"),
        t({ "", "\t]", ")" }),
        t({ "", "def test_" }),
        i(3, "fname"),
        t("("),
        d(4, get_node_value, { 1 }),
        t("):"),
        t({ "", "\tassert " }),
        d(5, get_node_value, { 3 }),
        t("("),
        d(6, fn_arguments, { 1 }),
        t(")"),
        t(" == expected"),
    }),
    s("@pytest_skip", {
        t('@pytest.mark.skip("Work in proress")'),
    }),
    s("def_test_fn", {

        t({ "def test_" }),
        i(1, "fname"),
        t("("),
        arguments_choice(2),
        t("):"),
        t({ "", "\tassert " }),
        d(3, get_node_value, { 1 }),
        t("("),
        d(4, get_node_value, { 2 }),
        t(")"),
        t(" == False"),
    }),
    s("capsys", t("stdout = capsys.readouterr().out")),
    s(
        "setuptools",
        fmt(
            [[
        import setuptools

        setuptools.setup(
            name="<a>",
            version="1.0.0",
            description="<b>",
            packages=setuptools.find_packages("src"),
            package_dir={"": "src"},
        )
    ]],
            {
                a = f(function()
                    return string.gsub(_G.vim.fn.getcwd(), "(.*/)(.*)", "%2")
                end, {}),
                b = i(1, "lorem ipsum"),
            },
            { delimiters = "<>" }
        )
    ),
}
