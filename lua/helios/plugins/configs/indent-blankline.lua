local status_ok, indent = pcall(require, 'indent_blankline')
if not status_ok then
    return
end

indent.setup {
    use_treesitter = true,

    show_current_context = true,
    show_current_context_start = true,
    show_first_indent_level = true,
    show_trailing_blankline_indent = false,

    context_patterns = {
        'class',
        'return',
        'function',
        'method',
        '^if',
        '^while',
        '^for',
        '^object',
        '^table',
        'block',
        'arguments',
        'if_statement',
        'else_clause',
        'js_element',
        'jsx_element',
        'jsx_self_closing_element',
        'try_statement',
        'catch_clause',
        'import_statement',
        'operation_type',
    },

    char = '▏',
    char_highlight_list = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent2',
        'IndentBlanklineIndent3',
        'IndentBlanklineIndent4',
        'IndentBlanklineIndent5',
        'IndentBlanklineIndent6',
    },
    space_char = ' ',
    space_char_highlight_list = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent2',
        'IndentBlanklineIndent3',
        'IndentBlanklineIndent4',
        'IndentBlanklineIndent5',
        'IndentBlanklineIndent6',
    },

    buftype_exclude = {
        'terminal',
        'nofile',
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

local cmd = vim.cmd

cmd [[hi IndentBlanklineIndent1 guifg=#ff8888 guibg=#1f1f1f]]
cmd [[hi IndentBlanklineIndent2 guifg=#88ffff guibg=#1a1a1a]]
cmd [[hi IndentBlanklineIndent3 guifg=#88ff88 guibg=#1f1f1f]]
cmd [[hi IndentBlanklineIndent4 guifg=#ff88ff guibg=#1a1a1a]]
cmd [[hi IndentBlanklineIndent5 guifg=#8888ff guibg=#1f1f1f]]
cmd [[hi IndentBlanklineIndent6 guifg=#ffff88 guibg=#1a1a1a]]

cmd [[hi IndentBlanklineContextStart gui=underline guisp=#9932bc]]
cmd [[hi IndentBlanklineContextChar  guifg=#9932bc]]
