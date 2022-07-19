local status_ok, indent = pcall(require, 'indent_blankline')
if not status_ok then
    return
end


local set_hl = require 'helios.core.utils'.set_highlight
local colors = require 'helios.theme.colors'

local indent_hl = colors.indents
local bg        = indent_hl.backgrounds
local ctx       = indent_hl.context

local highlight_list = {}

for i, v in ipairs(indent_hl) do
    local name = 'IndentBlanklineIndent' .. i
    table.insert(highlight_list, name)
    set_hl(name, {
        default   = true,
        fg        = v,
        bg        = bg[i % 2 + 1],
        nocombine = true,
    })
end

set_hl('IndentBlanklineContextChar', {
    default   = true,
    fg        = ctx,
    nocombine = true
})
set_hl('IndentBlanklineContextSpaceChar', {
    default   = true,
    fg        = ctx,
    nocombine = true
})
set_hl('IndentBlanklineContextStart', {
    default   = true,
    sp        = ctx,
    underline = true
})


indent.setup {
    enabled              = true,
    use_treesitter       = true,
    use_treesitter_scope = true,

    show_end_of_line               = false,
    show_first_indent_level        = true,
    show_trailing_blankline_indent = true,
    show_foldtext                  = true,

    show_current_context                       = true,
    show_current_context_start                 = true,
    show_current_context_start_on_current_line = true,

    char                   = '▏',
    char_blankline         = '',
    space_char_blankline   = ' ',
    context_char           = '▏',
    context_char_blankline = '▏',

    char_highlight_list                 = highlight_list,
    space_char_highlight_list           = highlight_list,
    space_char_blankline_highlight_list = {},
    context_highlight_list              = {},

    context_patterns = {
        'class',
        'return',
        'function',
        '^func',
        'method',
        '^if',
        'while',
        '^while',
        'for',
        '^for',
        'with',
        'try',
        'except',
        'object',
        '^object',
        'dictionary',
        'table',
        '^table',
        'tuple',
        'block',
        'do_block',
        'arguments',
        'argument_list',
        'if_statement',
        'else_clause',
        'element',
        'js_element',
        'jsx_element',
        'jsx_self_closing_element',
        'try_statement',
        'catch_clause',
        'import_statement',
        'operation_type',
    },

    buftype_exclude = {
        'terminal',
        'nofile',
        'quickfix',
    },
    filetype_exclude = {
        'lspinfo',
        'lsp-installer',
        'packer',
        'terminal',
        'checkhealth',
        'help',
        'man',
        'alpha',
        'dashboard',
        'startify',
        'neogitstatus',
        'NvimTree',
        'Trouble',
        'TelescopePrompt',
        'TelescopeResults',
        '',
    },
}
