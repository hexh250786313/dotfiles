require('neoscroll').setup({
    easing_function = "nil",
    cursor_scrolls_alone = false,
    -- hide_cursor = true,
    hide_cursor = false,
    mappings = {},
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
-- t['<S-Up>'] = {'scroll', {'-vim.wo.scroll', 'true', '350', [['sine']]}}
-- t['<S-Down>'] = {'scroll', { 'vim.wo.scroll', 'true', '350', [['sine']]}}
t['<S-Up>'] = {'scroll', {'-vim.wo.scroll', 'true', '100', [['sine']]}}
t['<S-Down>'] = {'scroll', { 'vim.wo.scroll', 'true', '100', [['sine']]}}
-- Use the "circular" easing function
-- t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
-- t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
-- Pass "nil" to disable the easing animation (constant scrolling speed)
-- t['<Up>'] = {'scroll', {'-0.10', 'false', '100', nil}}
-- t['<Down>'] = {'scroll', { '0.10', 'false', '100', nil}}
-- t['<Up>'] = {'scroll', {'-0.10', 'true', '10', nil}}
-- t['<Down>'] = {'scroll', { '0.10', 'true', '10', nil}}
-- t['<Up>'] = {'scroll', {'-0.10', 'true', '10', [['sine']]}}
-- t['<Down>'] = {'scroll', { '0.10', 'true', '10', [['sine']]}}
t['<Up>'] = {'scroll', {'-3', 'true', '50', [['sine']]}}
t['<Down>'] = {'scroll', { '3', 'true', '50', [['sine']]}}
-- When no easing function is provided the default easing function (in this case "quadratic") will be used
t['zt']    = {'zt', {'300'}}
t['zz']    = {'zz', {'300'}}
t['zb']    = {'zb', {'300'}}

require('neoscroll.config').set_mappings(t)
