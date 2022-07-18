local status_ok, todo_comment = pcall(require, 'todo-comments')
if not status_ok then
    return
end

local diag_icons = require 'helios.theme.icons'.diagnostics
local diag_colors = require 'helios.theme.colors'.diagnostics

todo_comment.setup {
    signs = true,
    sign_priority = 8,

    keywords = {
        FIX = {
            icon = diag_icons.debug,
            color = 'error',
            alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'fix', 'fixme', 'bug' },
        },
        TODO = {
            icon = diag_icons.todo,
            color = 'info',
        },
        HACK = {
            icon = diag_icons.hack,
            color = 'warning',
        },
        WARN = {
            icon = diag_icons.warning,
            color = 'warning',
            alt = { 'WARNING', 'XXX' },
        },
        PERF = {
            icon = diag_icons.performance,
            alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' },
        },
        NOTE = {
            icon = diag_icons.note,
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
        error   = { 'DiagnosticError', 'ErrorMsg', diag_colors.error },
        warning = { 'DiagnosticWarning', 'WarningMsg', diag_colors.warning },
        info    = { 'DiagnosticInfo', diag_colors.information },
        hint    = { 'DiagnosticHint', diag_colors.hint },
        default = { 'Identifier', diag_colors.default },
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
