require("noice").setup({
  cmdline = {
    enabled = true,
    view = "cmdline", -- 改回传统的命令行视图
    format = {
      input = { view = "cmdline_input", icon = " " },
    },
  },
  hover = {
    enabled = false,
  },
  routes = { -- 过滤信息
    {

      routes = {
        {
          filter = {
            event = "vim.diagnostic.open_float",
          },
          view = "hover",
        },
      },
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
          { find = "%d fewer lines" },
          { find = "%d more lines" },
          { find = "%d more lines" },
          { find = "Hop %d char" },
          { find = "%d lines yanked" },
        },
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        find = '%[coc.nvim%]: Error on notification.*Buffer %d+ not attached, not a normal buffer, buftype "nofile"',
      },
      opts = { skip = true },
    },
    {
      filter = { event = "msg_show", kind = "search_count" },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        find = "^E486: Pattern not found:",
      },
      opts = { skip = true },
    },
  },
  presets = {
    long_message_to_split = true, -- long messages will be sent to a split
  },
})
