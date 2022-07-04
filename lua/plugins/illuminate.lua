local g = vim.g
g.Illuminate_delay = 0
g.Illuminate_highlightUnderCursor = 0
g.Illuminate_ftblacklist = { 'alpha', 'NvimTree' }

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap('n', '<a-n>', ':lua require"illuminate".next_reference{wrap=true}<cr>', opts)
keymap('n', '<a-p>', ':lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', opts)
