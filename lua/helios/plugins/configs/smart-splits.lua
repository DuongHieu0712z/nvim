local status_ok, smart_splits = pcall(require, 'smart-splits')
if not status_ok then
    return
end

smart_splits.setup {
    ignored_filetypes = {
        'nofile',
        'quickfix',
        'prompt',
    },
    ignored_buftypes = { 'NvimTree' },
    move_cursor_same_row = false,
    resize_mode = {
        quit_key = '<esc>',
        silent = false,
        hooks = {
            on_enter = nil,
            on_leave = nil,
        },
    },
}
