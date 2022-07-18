local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    return
end

local diag_icons = require 'helios.theme.icons'.diagnostics
local diag_colors = require 'helios.theme.colors'.diagnostics

bufferline.setup {
    options = {
        mode = 'buffers',
        numbers = 'none',

        close_command = 'bdelete! %d',
        right_mouse_command = 'bdelete! %d',
        left_mouse_command = 'buffer %d',
        middle_mouse_command = nil,

        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',

        max_name_length = 16,
        max_prefix_length = 16,
        tab_size = 20,

        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local str = ' '
            local sym = {
                error = diag_icons.error,
                warning = diag_icons.warning,
                info = diag_icons.information,
                hint = diag_icons.hint,
            }
            for e, n in pairs(diagnostics_dict) do
                str = str .. n .. sym[e] .. ' '
            end
            return str
        end,

        offsets = { {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'center',
        } },

        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_buffer_default_icon = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,

        separator_style = 'slant',
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        sort_by = 'insert_after_current',

        groups = {
            options = {
                toggle_hidden_on_enter = true,
            },
            items = {
                require 'bufferline.groups'.builtin.pinned:with({ icon = '' }),
            }
        },

        custom_areas = {
            right = function()
                local res = {}
                local severity = vim.diagnostic.severity

                local error = #vim.diagnostic.get(0, { severity = severity.ERROR })
                if error ~= 0 then
                    table.insert(res, {
                        text = ' ' .. diag_icons.error .. error,
                        guifg = diag_colors.error,
                    })
                end

                local warning = #vim.diagnostic.get(0, { severity = severity.WARN })
                if warning ~= 0 then
                    table.insert(res, {
                        text = ' ' .. diag_icons.warning .. warning,
                        guifg = diag_colors.warning,
                    })
                end

                local info = #vim.diagnostic.get(0, { severity = severity.INFO })
                if info ~= 0 then
                    table.insert(res, {
                        text = ' ' .. diag_icons.information .. info,
                        guifg = diag_colors.information,
                    })
                end

                local hint = #vim.diagnostic.get(0, { severity = severity.HINT })
                if hint ~= 0 then
                    table.insert(res, {
                        text = ' ' .. diag_icons.hint .. hint,
                        guifg = diag_colors.hint,
                    })
                end

                return res
            end,
        },
    },
}
