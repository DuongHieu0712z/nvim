local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

treesitter.setup {
    ensure_installed = {
        'c',
        'cpp',
        'c_sharp',
        'java',
        'python',
        'html',
        'css',
        'scss',
        'javascript',
        'typescript',
        'go',
        'lua',
        'vim',
        'json',
        'yaml',
        'markdown',
        'comment',
    },

    sync_install = false,
    ignore_install = { '' },

    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = true,
    },
    rainbow = {
        enable = true,
        -- disable = {}, -- list languages
        extended_mode = false,
        max_file_lines = nil,
        -- colors = {}, -- table of hex strings
        -- termcolors = {}, -- table of colour name strings
    },

    incremental_selection = {
        enable = true,
        -- keymaps = {
        --     init_selection = 'gnn',
        --     node_incremental = 'grn',
        --     scope_incremental = 'grc',
        --     node_decremental = 'grm',
        -- },
    },

    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
        highlight_current_scope = { enable = true },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    playground = {
        enable = true,
    },
}

print 'treesitter'
