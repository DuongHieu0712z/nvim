local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
    return
end

toggleterm.setup({
    size = function(term)
        if term.direction == 'horizontal' then
            return 15
        elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
        end
    end,

    open_mapping    = '<a-f10>',
    hide_numbers    = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor  = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size    = true,
    direction       = 'vertical',
    close_on_exit   = true,
    shell           = 'pwsh',
    float_opts      = {
        border     = 'curved',
        winblend   = 0,
        highlights = {
            border     = 'Normal',
            background = 'Normal',
        },
    },
})

-- vim.cmd [[autocmd! TermOpen term://* lua set_terminal_keymaps()]]

-- local Terminal = require 'toggleterm.terminal'.Terminal

-- local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }
-- function _LAZYGIT_TOGGLE()
--     lazygit:toggle()
-- end

-- local node = Terminal:new { cmd = 'node', hidden = true }
-- function _NODE_TOGGLE()
--     node:toggle()
-- end

-- local ncdu = Terminal:new { cmd = 'ncdu', hidden = true }
-- function _NCDU_TOGGLE()
--     ncdu:toggle()
-- end

-- local htop = Terminal:new { cmd = 'htop', hidden = true }
-- function _HTOP_TOGGLE()
--     htop:toggle()
-- end

-- local python = Terminal:new { cmd = 'python', hidden = true }
-- function _PYTHON_TOGGLE()
--     python:toggle()
-- end
