require("neoscroll").setup(
  {
    easing_function = "nil",
    cursor_scrolls_alone = false,
    hide_cursor = false,
    mappings = {}
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

t["<S-Up>"] = {"scroll", {"-vim.wo.scroll", "true", "100", [['circular']]}}
t["<S-Down>"] = {"scroll", {"vim.wo.scroll", "true", "100", [['circular']]}}
-- t["<Up>"] = {"scroll", {"-3", "false", "50", [['quadratic']]}}
-- t["<Down>"] = {"scroll", {"3", "false", "50", [['quadratic']]}}
t["<Up>"] = {"scroll", {"-3", "true", "50", [['quadratic']]}}
t["<Down>"] = {"scroll", {"3", "true", "50", [['quadratic']]}}

require("neoscroll.config").set_mappings(t)
