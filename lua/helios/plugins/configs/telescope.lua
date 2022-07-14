local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

local actions = require 'telescope.actions'
local previewers = require 'telescope.previewers'
local sorters = require 'telescope.sorters'

local icons = require 'helios.theme.icons'

telescope.setup {
    defaults = {
        sorting_strategy = 'ascending',
        selection_strategy = 'reset',
        scroll_strategy = 'cycle',

        layout_strategy = 'horizontal',
        layout_config = {
            preview_cutoff = 120,
            prompt_position = 'top',
        },

        wrap_results = true,

        prompt_prefix = icons.telescope.prompt,
        selection_caret = icons.telescope.selection,
        entry_prefix = icons.telescope.entry,
        multi_icon = icons.telescope.multi,
        color_devicons = true,

        path_display = { 'smart' },

        hl_result_eol = true,
        dynamic_preview_title = false,

        results_title = 'Results',
        prompt_title = 'Prompt',

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

        cache_picker = {
            num_pickers = -1,
        },

        preview = {
            filesize_limit = false,
            timeout = 500,
            treesitter = true,
        },

        file_sorter = sorters.get_fzy_sorter,
        generic_sorter = sorters.get_fzy_sorter,
        prefilter_sorter = sorters.prefilter,

        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        buffer_previewer_maker = previewers.buffer_previewer_maker,

        file_ignore_patterns = {
            '.git',
            'node_modules',
            'vendor',
        },
    },

    pickers = {
        find_files = {
            hidden = true,
        },
    },

    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
        aerial = {
            show_nesting = true,
        },
    },
}
