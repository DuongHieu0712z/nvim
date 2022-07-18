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
    text_objects = {
        enable = true,
    },

    rainbow = {
        enable = true,
        -- disable = {}, -- list languages
        extended_mode = false,
        max_file_lines = nil,
        -- colors = {}, -- table of hex strings
        -- termcolors = {}, -- table of colour name strings
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

local set_hl = require 'helios.core.utils'.set_highlight
local colors = require 'helios.theme.colors'

local treesitter_hl = colors.treesitter
for k, v in pairs(treesitter_hl) do
    if type(v) == 'string' then
        v = { fg = v }
    end
    set_hl('TS' .. k, v)
end

local rainbows = colors.rainbows
for i, v in ipairs(rainbows) do
    set_hl('rainbowcol' .. i, { fg = v })
end
