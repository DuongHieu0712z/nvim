local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

local languages = {
    'c',
    'cpp',
    'c_sharp',
    'java',
    'python',

    'html',
    'css',
    'scss',
    'javascript',
    'jsdoc',
    'typescript',
    'tsx',
    'embedded_template',

    -- 'vue',

    'go',
    'lua',
    'vim',

    'markdown',
    'markdown_inline',
    'json',
    'json5',
    'jsonc',
    -- 'yaml',
    -- 'toml',

    'sql',

    'comment',
    'regex',
}

treesitter.setup {
    ensure_installed = languages,

    sync_install = false,
    auto_install = true,
    ignore_install = { '' },

    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
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
    indent = {
        enable = true,
    },

    -- Treesitter playground
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
        -- keybindings = {
        --     toggle_query_editor = 'o',
        --     toggle_hl_groups = 'i',
        --     toggle_injected_languages = 't',
        --     toggle_anonymous_nodes = 'a',
        --     toggle_language_display = 'I',
        --     focus_language = 'f',
        --     unfocus_language = 'F',
        --     update = 'R',
        --     goto_node = '<cr>',
        --     show_help = '?',
        -- },
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { 'BufWrite', 'CursorHold' },
    },

    -- Treesitter refactor
    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
        highlight_current_scope = { enable = true },
        smart_rename = {
            enable = true,
            -- keymaps = {
            --     smart_rename = 'grr',
            -- },
        },
        navigation = {
            enable = true,
            -- keymaps = {
            --     goto_definition = 'gnd',
            --     list_definitions = 'gnD',
            --     list_definitions_toc = 'gO',
            --     goto_next_usage = '<a-*>',
            --     goto_previous_usage = '<a-#>',
            -- },
        },
    },

    -- Treesitter textobjects
    textobjects = {
        enable = true,
        select = {
            enable = true,
            lookahead = true,
            -- keymaps = {
            --     ['af'] = '@function.outer',
            --     ['if'] = '@function.inner',
            --     ['ac'] = '@class.outer',
            --     ['ic'] = '@class.inner',
            -- },
        },
        swap = {
            enable = true,
            -- swap_next = {
            --     ['<leader>a'] = { '@parameter.inner' },
            -- },
            -- swap_previous = {
            --     ['<leader>A'] = { '@parameter.inner' },
            -- },
        },
        move = {
            enable = true,
            set_jumps = true,
            -- goto_next_start = {
            --     [']m'] = { '@function.outer', '@class.outer' },
            -- },
            -- goto_next_end = {
            --     [']M'] = { '@function.outer', '@class.outer' },
            -- },
            -- goto_previous_start = {
            --     ['[m'] = { '@function.outer', '@class.outer' },
            -- },
            -- goto_previous_end = {
            --     ['[M'] = { '@function.outer', '@class.outer' },
            -- },
        },
        lsp_interop = {
            enable = true,
            border = 'rounded',
            -- peek_definition_code = {
            --     ['<leader>df'] = '@function.outer',
            --     ['<leader>dF'] = '@class.outer',
            -- },
        },
    },

    -- Treesitter pairs
    pairs = {
        enable = true,
        disable = {},
        highlight_pair_events = {},
        highlight_self = false,
        goto_right_end = false,
        fallback_cmd_normal = [[call matchit#Match_wrapper('', 1, 'n')]],
        -- keymaps = {
        --     goto_partner = '<leader>%',
        --     delete_balanced = 'X',
        -- },
        delete_balanced = {
            only_on_first_char = false,
            fallback_cmd_normal = nil,
            longest_partner = false,
        },
    },

    -- Treesitter endwise
    endwise = {
        enable = true,
    },

    -- Treesitter commentstring
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
        -- config = {},
    },

    -- Treesitter rainbow
    rainbow = {
        enable = true,
        disable = {},
        extended_mode = false,
        max_file_lines = nil,
        -- colors = {},
        -- termcolors = {},
    },

    -- Treesitter autotag
    autotag = {
        enable = true,
    },
}


local utils  = require 'helios.core.utils'
local colors = require 'helios.theme.colors'

local merge_tb = utils.merge_table
local set_hl   = utils.set_highlight

local treesitter_hl = colors.treesitter
for k, v in pairs(treesitter_hl) do
    if type(v) == 'string' then
        v = { fg = v }
    end
    -- v = merge_tb(v, { default = true })
    set_hl('TS' .. k, v)
end

local rainbows = colors.rainbows
for i, v in ipairs(rainbows) do
    set_hl('rainbowcol' .. i, {
        -- default = true,
        fg = v,
    })
end
