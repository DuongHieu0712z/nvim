local status_ok, indent = pcall(require, 'guess-indent')
if not status_ok then
    return
end

indent.setup {
    auto_cmd = true,
    filetype_exclude = {
        'netrw',
        'tutor',
    },
    buftype_exclude = {
        'help',
        'nofile',
        'terminal',
        'prompt',
    },
}
