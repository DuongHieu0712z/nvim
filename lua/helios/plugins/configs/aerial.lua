local status_ok, aerial = pcall(require, 'aerial')
if not status_ok then
    return
end

local kind_icons = require 'helios.theme.icons'.kind_icons

aerial.setup {
    backends = { 'treesitter', 'lsp', 'markdown' },
    close_behavior = 'auto',

    default_bindings = true,
    default_direction = 'prefer_right',

    disable_max_lines = 10000,
    disable_max_size = 2000000,

    filter_kind = false,

    highlight_mode = 'split_width',
    highlight_closest = true,
    highlight_on_hover = false,
    highlight_on_jump = 300,

    icons = kind_icons,

    ignore = {
        unlisted_buffers = true,
        filetypes = {},
        buftypes = 'special',
        winfyptes = 'special',
    },

    manage_folds = false,
    link_folds_to_tree = false,
    link_tree_to_folds = true,

    width = nil,
    min_width = 20,
    max_width = { 50, 0.2 },

    nerd_font = 'auto',

    on_attach = function(bufnr)
        local opt = {
            silent = true,
            noremap = true,
            nowait = true,
        }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>c', '<cmd>AerialToggle!<cr>', opt)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<cr>', opt)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<cr>', opt)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<cr>', opt)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<cr>', opt)
    end,
    on_first_symbols = function(bufnr)
        -- TODO:
    end,

    open_automatic = false,
    placement_editor_edge = false,
    post_jump_cmd = 'normal! zz',
    close_on_select = false,
    update_events = 'TextChanged,InsertLeave',

    show_guides = true,
    guides = {
        mid_item = '├─',
        last_item = '└─',
        nested_top = '│ ',
        whitespace = '  ',
    },

    float = {
        border = 'rounded',
        relative = 'cursor',

        height = nil,
        min_height = { 8, 0.1 },
        max_height = 0.9,

        override = function(conf)
            return conf
        end,
    },

    lsp = {
        diagnostics_trigger_update = true,
        update_when_errors = true,
        update_delay = 300,
    },
    treesitter = {
        update_delay = 300,
    },
    markdown = {
        update_delay = 300,
    },
}
