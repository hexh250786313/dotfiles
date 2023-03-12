require("neoscroll").setup(
  {
    easing_function = "nil",
    cursor_scrolls_alone = false,
    hide_cursor = true,
    mappings = {},
    -- pre_hook = function(info) if info == "cursorline" then vim.wo.cursorline = false end end,
    -- post_hook = function(info) if info == "cursorline" then vim.wo.cursorline = true end end
    pre_hook = function(info) end,
    post_hook = function(info) end
  }
)

local t = {}
-- t["<S-Up>"] = {"scroll", {"-vim.wo.scroll", "true", "100", [['sine']]}}
-- t["<S-Down>"] = {"scroll", {"vim.wo.scroll", "true", "100", [['sine']]}}
-- -- t["<Up>"] = {"scroll", {"-3", "false", "50", [['sine']]}}
-- -- t["<Down>"] = {"scroll", {"3", "false", "50", [['sine']]}}
-- t["<Up>"] = {"scroll", {"-3", "true", "50", [['sine']]}}
-- t["<Down>"] = {"scroll", {"3", "true", "50", [['sine']]}}
t["zt"] = {"zt", {"200"}}
t["zz"] = {"zz", {"200"}}
t["zb"] = {"zb", {"200"}}

t["<S-Up>"] = {"scroll", {"-vim.wo.scroll", "true", "100", 'circular', [['cursorline']]}}
t["<S-Down>"] = {"scroll", {"vim.wo.scroll", "true", "100", 'circular', [['cursorline']]}}
-- t["<Up>"] = {"scroll", {"-3", "false", "50", 'quadratic', [['cursorline']]}}
-- t["<Down>"] = {"scroll", {"3", "false", "50", 'quadratic', [['cursorline']]}}
-- t['<Up>'] = {'scroll', {'-0.10', 'false', '100'}}
-- t['<Down>'] = {'scroll', { '0.10', 'false', '100'}}

require("neoscroll.config").set_mappings(t)
