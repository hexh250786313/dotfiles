require("config-local").setup({
  -- Default configuration (optional)
  config_files = { ".vim/rc.lua" },
  silent = true,
  lookup_parents = true, -- 往上找配置文件, false 时为当前目录找
  -- hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
  -- autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
  -- commands_create = true, -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalIgnore)
})
