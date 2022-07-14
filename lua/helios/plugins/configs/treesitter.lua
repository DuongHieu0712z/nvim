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

local cmd = vim.cmd

cmd [[hi TSAnnotation         guifg=#8ebd6b]]
cmd [[hi TSAttribute          guifg=#88ffff]]
cmd [[hi TSBoolean            guifg=#fe8679]]
cmd [[hi TSCharacter          guifg=#ffff44]]
cmd [[hi TSConstant           guifg=#e55561]]
cmd [[hi TSField              guifg=#ecc812]]
cmd [[hi TSFloat              guifg=#48b0bd]]
cmd [[hi TSNumber             guifg=#48b0bd]]
cmd [[hi TSOperator           guifg=#ffadd2]]
cmd [[hi TSParameter          guifg=#ecac38]]
cmd [[hi TSParameterReference guifg=#ecac38]]
cmd [[hi TSProperty           guifg=#50c0cc]]
cmd [[hi TSString             guifg=#ffff44]]
cmd [[hi TSVariable           guifg=#ec9706]]
cmd [[hi TSTag                guifg=#fe8812]]
cmd [[hi TSTagDelimiter       guifg=#fe8812]]

cmd [[hi rainbowcol1 guifg=#dc143c]]
cmd [[hi rainbowcol2 guifg=#ff8c00]]
cmd [[hi rainbowcol3 guifg=#ffd700]]
cmd [[hi rainbowcol4 guifg=#32cd32]]
cmd [[hi rainbowcol5 guifg=#4169e1]]
cmd [[hi rainbowcol6 guifg=#a28be7]]
cmd [[hi rainbowcol7 guifg=#ba55d3]]
