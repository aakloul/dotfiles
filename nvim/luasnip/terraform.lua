local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local date = function()
    local time = os.time()
    local d = 3
    if (os.date("*t").wday > 3) then -- Thu, Fri, Sat
        d = 5
    end
    time = time + d * 24 * 60 * 60
    return { os.date("%Y-%m-%d", time) }
end

return {
    s("tftrig", t("also loaded!!")),
    s("tftest", t("test autotriggered, if enabled")),
    s("tfautotrig", t("autotriggered, if enabled")),
}, {
    s("tftemp", {
        t({ 'module "PROD-' }), i(1, "29860"), t({ '_' }), f(date, {}), t({ '" {' }),
        t({ "", '  source = "./modules/temporary_access"' }),
        t({ "", '  expires_at = "' }), f(date, {}), t({ 'T15:30:00Z"' }),
        t({ "", '  users = [' }),
        t({ "", '    okta_user.adel_akloul.id,' }),
        t({ "", '  ]' }),
        t({ "", '}' }),
    }),
}
