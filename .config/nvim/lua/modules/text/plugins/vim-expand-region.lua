vim.cmd(
  [[
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'ib'  :0,
      \ 'iB'  :0,
      \ 'i"'  :1,
      \ 'i''' :1,
      \ 'a)'  :0,
      \ 'a]'  :0,
      \ 'i]'  :0,
      \ 'a}'  :0,
      \ 'i>'  :0,
      \ 'a>'  :0,
      \ 'i`'  :1,
      \ 'ip'  :0,
      \ 'it'  :0,
      \ 'at'  :0,
      \ }

xmap v <Plug>(expand_region_expand)
xmap V <Plug>(expand_region_shrink)
]]
)

-- 数字意味着 [count]
-- see :h text-objects
-- \ 'iw'  :0, -- inner word
-- \ 'iW'  :0, -- inner WORD
-- \ 'ib'  :0, -- inner block
-- \ 'iB'  :0, -- inner Block
-- \ 'i"'  :1,
-- \ 'i''' :1,
-- \ 'a]'  :0,
-- \ 'i]'  :0,
-- \ 'a}'  :0,
-- \ 'i>'  :0,
-- \ 'a>'  :0,
-- \ 'i`'  :1,
-- \ 'ip'  :0, -- inner paragraph
-- \ 'it'  :0, -- inner tag
-- \ 'at'  :0, -- all tag
