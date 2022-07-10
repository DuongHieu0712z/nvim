local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

local diag_icons = require 'helios.theme.icons'.diagnostics

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local mode = {
    'mode',
    fmt = function(str)
        return '-- ' .. str .. ' --'
    end,
}

local branch = {
    'branch',
    icons_enabled = true,
    icon = '',
    fmt = function(str)
        return str
    end,
}

local diagnostics = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'error', 'warn', 'info', 'hint' },
    symbols = {
        error = diag_icons.error,
        warn = diag_icons.warning,
        info = diag_icons.information,
        hint = diag_icons.hint,
    },
    colored = true,
    update_in_insert = true,
    always_visible = true,
    cond = hide_in_width,
}

local filename = {
    'filename',
    file_status = true,
    path = 0,
    shorting_target = 40,
    symbols = {
        modified = '[]',
        readonly = '[]',
        unnamed = '[No Name]',
    },
    cond = hide_in_width,
}

local diff = {
    'diff',
    colored = true,
    symbols = {
        added = ' ',
        modified = ' ',
        removed = ' ',
    },
    cond = hide_in_width,
}

local space = {
    'space',
    fmt = function()
        return 'Spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
    end,
    cond = hide_in_width,
}

local location = {
    'location',
    fmt = function()
        local line = vim.fn.line('.')
        local col = vim.fn.col('.')
        return ' ' .. line .. ':' .. col
    end,
}

local progress = {
    'progress',
    fmt = function(str)
        local current_line = vim.fn.line('.')
        local total_lines = vim.fn.line('$')
        local chars = { '██', '▇▇', '▆▆', '▅▅', '▄▄', '▃▃', '▂▂', '▁▁', '  ' }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return str .. ' ' .. chars[index]
    end,
}

lualine.setup {
    options = {
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'dashboard', 'startify', 'NvimTree', 'Outline', 'toggleterm', 'aerial' },
        always_divide_middle = true,
        globalstatus = false,
    },

    sections = {
        lualine_a = { mode },
        lualine_b = { branch, diagnostics },
        lualine_c = { filename },
        lualine_x = { diff },
        lualine_y = { space, 'encoding', 'fileformat', 'filetype' },
        lualine_z = { location, progress },
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },

    tabline = {},
    extensions = {},
}
