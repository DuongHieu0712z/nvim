local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

local actions = require 'telescope.actions'

telescope.setup {
    defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        path_display = { 'smart' },

        file_ignore_patterns = {
            '.git',
            'node_modules',
        },

        mappings = {
            n = {
                ['esc'] = actions.close,
                ['<cr>'] = actions.select_default,
                ['<c-x>'] = actions.select_horizontal,
                ['<c-v>'] = actions.select_vertical,
                ['<c-t>'] = actions.select_tab,

                ['<tab>'] = actions.toggle_selection + actions.move_selection_worse,
                ['<s-tab>'] = actions.toggle_selection + actions.move_selection_better,
                ['<c-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<m-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

                ['j'] = actions.move_selection_next,
                ['k'] = actions.move_selection_previous,
                ['H'] = actions.move_to_top,
                ['M'] = actions.move_to_middle,
                ['L'] = actions.move_to_bottom,

                ['<down>'] = actions.move_selection_next,
                ['<up>'] = actions.move_selection_previous,
                ['gg'] = actions.move_to_top,
                ['G'] = actions.move_to_bottom,

                ['<c-u>'] = actions.preview_scrolling_up,
                ['<c-d>'] = actions.preview_scrolling_down,

                ['<PageUp>'] = actions.results_scrolling_up,
                ['<PageDown>'] = actions.results_scrolling_down,

                ['?'] = actions.which_key,
            },

            i = {
                ['<c-n>'] = actions.cycle_history_next,
                ['<c-p>'] = actions.cycle_history_prev,

                ['<c-j>'] = actions.move_selection_next,
                ['<c-k>'] = actions.move_selection_previous,

                ['<c-c>'] = actions.close,

                ['<down>'] = actions.move_selection_next,
                ['<up>'] = actions.move_selection_previous,

                ['<cr>'] = actions.select_default,
                ['<c-x>'] = actions.select_horizontal,
                ['<c-v>'] = actions.select_vertical,
                ['<c-t>'] = actions.select_tab,

                ['<c-u>'] = actions.preview_scrolling_up,
                ['<c-d>'] = actions.preview_scrolling_down,

                ['<PageUp>'] = actions.results_scrolling_up,
                ['<PageDown>'] = actions.results_scrolling_down,

                ['<tab>'] = actions.toggle_selection + actions.move_selection_worse,
                ['<s-tab>'] = actions.toggle_selection + actions.move_selection_better,
                ['<c-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<m-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                ['<c-l>'] = actions.complete_tag,
                ['<c-_>'] = actions.which_key, -- keys from pressing <C-/>
            },
        },

        pickers = {
            find_files = {
                hidden = true,
            },
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            },
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
            },
        },
    }
}

telescope.load_extension 'fzy_native'
telescope.load_extension 'fzf'
telescope.load_extension 'projects'

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('', '<c-p>', ':Telescope find_files<cr>', opts)
keymap('n', '<leader>ff', ':Telescope find_files<cr>', opts)
keymap('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<cr>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<cr>', opts)
