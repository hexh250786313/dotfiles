local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  -- file_panel = {
    -- position = "left",                  -- One of 'left', 'right', 'top', 'bottom'
    -- width = 35,                         -- Only applies when position is 'left' or 'right'
    -- height = 10,                        -- Only applies when position is 'top' or 'bottom'
    -- listing_style = "tree",             -- One of 'list' or 'tree'
    -- tree_options = {                    -- Only applies when listing_style is 'tree'
      -- flatten_dirs = true,              -- Flatten dirs that only contain one single dir
      -- folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
    -- },
  -- },
  file_history_panel = {
    -- position = "bottom",
    -- width = 35,
    height = 1,
    -- log_options = {
      -- max_count = 256,      -- Limit the number of commits
      -- follow = false,       -- Follow renames (only for single file)
      -- all = false,          -- Include all refs under 'refs/' including HEAD
      -- merges = false,       -- List only merge commits
      -- no_merges = false,    -- List no merge commits
      -- reverse = false,      -- List commits in reverse order
    -- },
  },
}
