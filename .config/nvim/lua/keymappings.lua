require("modules.buffer.keymappings")
require("modules.code.keymappings")
require("modules.coc.keymappings")
require("modules.git.keymappings")
require("modules.motion.keymappings")
require("modules.highlight.keymappings")

-- 取消默认 keymap gra/grn/gri/grr
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grr")
-- vim.keymap.del("n", "K")
