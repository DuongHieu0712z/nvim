local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    return
end

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
                error = ' ',
                warning = ' ',
                info = ' ',
                hint = ' ',
            }
            for e, n in pairs(diagnostics_dict) do
                str = str .. n .. sym[e]
            end
            return str
        end,

        offsets = { {
            filetype = 'NvimTree',
            text = 'File Explorer',
        } },

        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,

        separator_style = 'slant',
        enforce_regular_tabs = true,
        always_show_bufferline = true,

        custom_areas = {
            right = function()
                local result = {}
                local seve = vim.diagnostic.severity
                local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
                local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
                local info = #vim.diagnostic.get(0, { severity = seve.INFO })
                local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

                if error ~= 0 then
                    table.insert(result, { text = '' .. error .. ' ', guifg = '#E55561' })
                end

                if warning ~= 0 then
                    table.insert(result, { text = '' .. warning .. ' ', guifg = '#E2B86B' })
                end

                if info ~= 0 then
                    table.insert(result, { text = '' .. info .. ' ', guifg = '#BF68D9' })
                end

                if hint ~= 0 then
                    table.insert(result, { text = '' .. hint .. ' ', guifg = '#48B0BD' })
                end

                return result
            end,
        },
    },
}
