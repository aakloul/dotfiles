local ls = require("luasnip")
ls.setup({
    region_check_events = "InsertEnter",
})
ls.config.set_config({
    history = true, -- keep around last snippet local to jump back
    enable_autosnippets = true,
})
require("luasnip.loaders.from_vscode").lazy_load()
-- require("luasnip.loaders.from_lua").lazy_load({
--     paths = {
--         "~/.config/nvim/luasnip/",
--         --"~/.local/share/nvim/site/pack/packer/start/LuaSnip-snippets.nvim/lua/luasnip_snippets/snippets/",
--     }
-- })
-- require("luasnip.loaders.from_lua").load({
--     paths = {
--         "~/.local/share/nvim/site/pack/packer/start/LuaSnip-snippets.nvim/lua/luasnip_snippets/snippets/",
--     }
-- })
--ls.snippets = require("luasnip_snippets").load_snippets() -- BUG: won't load snippets to luasnip

-- in a lua file: search lua-, then c-, then all-snippets.
ls.filetype_extend("lua", { "c" })
-- in a cpp file: search c-snippets, then all-snippets only (no cpp-snippets!!).
ls.filetype_set("cpp", { "c" })
ls.filetype_set("python", { "py" })
ls.filetype_extend("all", { "_" })


local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key


local keymap = _G.vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
_G.vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then
        ls.change_choice()
    end
end, opts)

-- local snip = ls.snippet
-- local node = ls.snippet_node
-- local text = ls.text_node
-- local insert = ls.insert_node
-- local func = ls.function_node
-- local choice = ls.choice_node
-- local dynamicn = ls.dynamic_node

ls.config.set_config({
    store_selection_keys = '<c-s>',
})

local date = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets(nil, {
    all = {
        s({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            f(date, {}),
        }),
    },
})

local meta = s({
        trig = "meta",
        namr = "Metadata",
        dscr = "Yaml metadata format for markdown"
    },
    {
        t({ "---", "title: " }), i(1, "note_title"),
        t({ "", "author: " }), i(2, "author"),
        t({ "", "date: " }), f(date, {}),
        t({ "", "categories: [" }), i(3, ""),
        t({ "]", "lastmod: " }), f(date, {}),
        t({ "", "tags: [" }), i(4),
        t({ "]", "comments: true", "---", "" }),
        i(0)
    }
)

local function fn(
    args,     -- text from i(2) in this example i.e. { { "456" } }
    parent,   -- parent snippet or parent node
    user_args -- user_args from opts.user_args
)
    return '[' .. args[1][1] .. user_args .. ']'
end

local trig = s("trig", {
    i(1), t '<-i(1) ',
    f(fn,                                     -- callback (args, parent, user_args) -> string
        { 2 },                                -- node indice(s) whose text is passed to fn, i.e. i(2)
        { user_args = { "user_args_value" } } -- opts
    ),
    t ' i(2)->', i(2), t '<-i(2) i(0)->', i(0)
})


local mdlink = s({
        trig = "link",
        namr = "markdown_link",
        dscr = "Create markdown link [txt](url)"
    },
    {
        t('['),
        i(1),
        t(']('),
        f(function(_, snip)
            return snip.env.TM_SELECTED_TEXT[1] or {}
        end, {}),
        t(')'),
        i(0),
    }
)

ls.add_snippets("all", {
    trig, meta, mdlink
})
