local status_ok, notify = pcall(require, 'notify')
if not status_ok then
    return
end

notify.setup {
    render = 'default',
    stages = 'fade_in_slide_out',

    on_open = nil,
    on_close = nil,

    timeout = 175,
    background_colour = 'Normal',
    minimum_width = 10,

    icons = {
        ERROR = '',
        WARN = '',
        INFO = '',
        DEBUG = '',
        TRACE = '',
    },
}

vim.notify = notify
