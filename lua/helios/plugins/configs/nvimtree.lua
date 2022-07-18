local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
    return
end

local tree_callback = nvim_tree_config.nvim_tree_callback

local icons = require 'helios.theme.icons'

nvim_tree.setup {
    disable_netrw = false,
    hijack_netrw = true,

    open_on_setup = false,
    open_on_setup_file = false,
    ignore_buffer_on_setup = false,
    ignore_ft_on_setup = {
        'alpha',
        'dashboard',
        'startify',
    },

    auto_reload_on_write = true,
    create_in_closed_folder = true,
    open_on_tab = false,
    sort_by = 'name',

    hijack_unnamed_buffer_when_opening = true,
    hijack_cursor = true,
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = false,

    reload_on_bufenter = true,
    respect_buf_cwd = true,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },

    update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
    },

    system_open = {
        cmd = nil,
        args = {},
    },

    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            error = icons.diagnostics.error,
            warning = icons.diagnostics.warning,
            info = icons.diagnostics.information,
            hint = icons.diagnostics.hint,
        },
    },

    git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        timeout = 500,
    },

    filesystem_watchers = {
        enable = true,
        interval = 100,
        debounce_delay = 50,
    },

    view = {
        adaptive_size = true,
        centralize_selection = true,
        hide_root_folder = true,

        width = 30,
        height = 30,
        side = 'left',
        preserve_window_proportions = false,

        number = false,
        relativenumber = false,
        signcolumn = 'yes',

        mappings = {
            custom_only = false,
            list = {
                { key = { 'l', '<cr>', 'o' }, cb = tree_callback 'edit' },
                { key = 'h', cb = tree_callback 'close_node' },
                { key = 'v', cb = tree_callback 'vsplit' },
            },
        },
    },

    renderer = {
        add_trailing = false,
        group_empty = false,
        full_name = true,

        highlight_git = true,
        highlight_opened_files = 'all',

        root_folder_modifier = ':~',

        indent_markers = {
            enable = true,
            icons = icons.indent_markers,
        },

        icons = {
            webdev_colors = true,
            git_placement = 'after',
            padding = ' ',
            symlink_arrow = ' ➛ ',

            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },

            glyphs = {
                default = icons.others.default,
                symlink = icons.others.symlink,
                folder = icons.folders,
                git = {
                    unstaged = '',
                    staged = 'S',
                    unmerged = '',
                    renamed = '➜',
                    untracked = 'U',
                    deleted = '',
                    ignored = '◌',
                },
            },
        },
    },

    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },

    trash = {
        cmd = 'trash',
        require_confirm = true,
    },

    actions = {
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
            exclude = {},
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
                exclude = {
                    filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame', },
                    buftype  = { 'nofile', 'terminal', 'help', },
                }
            },
        },
        remove_file = {
            close_window = true,
        },
        use_system_clipboard = true,
    },

    live_filter = {
        prefix = '[' .. icons.others.filter .. ']: ',
        always_show_folders = true,
    },

    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            profile = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            watcher = false,
        }
    },
}

-- See more information at https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt or `:help nvim-tree.setup`
