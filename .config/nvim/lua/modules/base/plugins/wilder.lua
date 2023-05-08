local wilder = require "wilder"

vim.cmd([[
call wilder#setup({
  \    'modes': [':', '/'],
  \    'next_key': '<c-j>',
  \    'previous_key': '<c-k>',
  \  })
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])
]])

wilder.set_option("renderer", wilder.popupmenu_renderer({
  highlighter = wilder.basic_highlighter(),
  left = {" ", wilder.popupmenu_devicons(), " "},
  right = {" ", wilder.popupmenu_scrollbar(), " "},
  pumblend = 15
}))

-- -- floating window
-- wilder.set_option(
--   "renderer",
--   wilder.popupmenu_renderer(
--     wilder.popupmenu_palette_theme(
--       {
--         -- 'single', 'double', 'rounded' or 'solid'
--         -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
--         -- border = "single",
--         -- border = "solid",
--         border = {" ", " ", " ", "", "", "█", "█", "█"},
--         max_height = "75%", -- max height of the palette
--         min_height = 0, -- set to the same as 'max_height' for a fixed height window
--         prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
--         prompt_border = {"▂", "▂", "▂"},
--         reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
--         -- pumblend = 15, -- once it sets, it will override the hilight group
--         left = {" ", wilder.popupmenu_devicons(), " "},
--         right = {" ", wilder.popupmenu_scrollbar(), " "},
--         highlights = {
--           default = "Visual",
--           border = "WilderBorder",
--           selected = "DiffAdd",
--           prompt = "StatusLine"
--         }
--       }
--     )
--   )
-- )
