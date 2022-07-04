local status_ok, scroll = pcall(require, 'neoscroll')
if not status_ok then
    return
end

scroll.setup {
    easing_function = 'quadratic',
    mappings = { '<c-u>', '<c-d>', '<c-b>', '<c-f>',
        '<c-y>', '<c-e>', 'zt', 'zz', 'zb' },
    hide_cursor = true,
    stop_eof = true,
    use_local_scrolloff = false,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    pre_hook = function(info) if info == 'cursorline' then vim.wo.cursorline = false end end,
    post_hook = function(info) if info == 'cursorline' then vim.wo.cursorline = true end end,
    performance_mode = false,
}

local t    = {}
t['<c-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '350', 'sine', [['cursorline']] } }
t['<c-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '350', 'sine', [['cursorline']] } }
t['<c-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']] } }
t['<c-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']] } }
t['<c-y>'] = { 'scroll', { '-0.10', 'false', '100', nil } }
t['<c-e>'] = { 'scroll', { '0.10', 'false', '100', nil } }
t['zt']    = { 'zt', { '300' } }
t['zz']    = { 'zz', { '300' } }
t['zb']    = { 'zb', { '300' } }
require 'neoscroll.config'.set_mappings(t)
