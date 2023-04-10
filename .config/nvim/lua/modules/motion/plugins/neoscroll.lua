require("neoscroll").setup({
    easing_function = "nil",
    cursor_scrolls_alone = false,
    hide_cursor = true,
    mappings = {},
    pre_hook = function(info) end,
    post_hook = function(info) end
})

local t = {}
t["zt"] = {"zt", {"200"}}
t["zz"] = {"zz", {"200"}}
t["zb"] = {"zb", {"200"}}

t["<S-Up>"] = {
    "scroll", {"-vim.wo.scroll", "true", "100", "circular", [['cursorline']]}
}
t["<S-Down>"] = {
    "scroll", {"vim.wo.scroll", "true", "100", "circular", [['cursorline']]}
}

require("neoscroll.config").set_mappings(t)
