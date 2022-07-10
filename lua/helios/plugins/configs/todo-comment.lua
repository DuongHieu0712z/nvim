local status_ok, todo_comment = pcall(require, 'todo-comments')
if not status_ok then
    return
end

todo_comment.setup {
    signs = true,
    sign_priority = 8,

    keywords = {
        FIX = {
            icon = '',
            color = 'error',
            alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'fix', 'fixme', 'bug' },
        },
        TODO = {
            icon = '',
            color = 'info',
        },
        HACK = {
            icon = '',
            color = 'warning',
        },
        WARN = {
            icon = '',
            color = 'warning',
            alt = { 'WARNING', 'XXX' },
        },
        PERF = {
            icon = '',
            alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' },
        },
        NOTE = {
            icon = '',
            color = 'hint',
            alt = { 'INFO' },
        },
    },

    merge_keywords = true,

    highlight = {
        before = 'fg',
        keyword = 'wide',
        after = 'fg',
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
    },

    colors = {
        error = { 'DiagnosticError', 'ErrorMsg', '#dc2626' },
        warning = { 'DiagnosticWarning', 'WarningMsg', '#fbbf24' },
        info = { 'DiagnosticInfo', '#2563eb' },
        hint = { 'DiagnosticHint', '#10b981' },
        default = { 'Identifier', '#7c3aed' },
    },

    search = {
        command = 'rg',
        args = {
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
        },
        pattern = [[\b(KEYWORDS):]],
    },
}
