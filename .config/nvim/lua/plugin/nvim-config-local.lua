require("config-local").setup {
  -- Default configuration (optional)
  config_files = {".vim/rc.lua"},
  silent = true
  -- hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
  -- autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
  -- commands_create = true, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
  -- lookup_parents = false -- Lookup config files in parent directories
}
