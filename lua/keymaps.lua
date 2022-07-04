local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
local noremap = { noremap = true }
local silent = { silent = true }

-- Remap space as leader key
keymap('', '<space>', '<nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal = 'n'
--   insert = 'i'
--   visual = 'v'
--   visual_block = 'x'
--   termial = 't'
--   command = 'c'

--[[
    NORMAL MODE
--]]

-- Edit and refresh file init.lua
keymap('n', '<leader>ve', ':edit $MYVIMRC<cr>', opts)
keymap('n', '<leader>vr', ':source $MYVIMRC<cr>', opts)

-- No highlight
keymap('n', '<esc>', ':noh<cr>', opts)

-- Save and quit
keymap('n', '<leader>w', ':w!<cr>', opts)
keymap('n', '<leader>q', ':q!<cr>', opts)

-- Resize with arrows
keymap('n', '<c-up>', ':resize -2<cr>', opts)
keymap('n', '<c-down>', ':resize +2<cr>', opts)
keymap('n', '<c-left>', ':vertical resize -2<cr>', opts)
keymap('n', '<c-right>', ':vertical resize +2<cr>', opts)

-- Buffer navigation
keymap('n', '<s-l>', ':bnext<cr>', opts)
keymap('n', '<s-h>', ':bprevious<cr>', opts)

-- Move text
keymap('n', '<a-j>', '<esc>:move .+1<cr>==gi', opts)
keymap('n', '<a-k>', '<esc>:move .-2<cr>==gi', opts)

--[[
    INSERT MODE
--]]

-- Fast return normal mode
keymap('i', 'jk', '<esc>', opts)

--[[
    VISUAL MODE
--]]

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text
keymap('v', '<a-j>', ':move .+1<cr>==', opts)
keymap('v', '<a-k>', ':move .-2<cr>==', opts)

--[[
    VISUAL BLOCK MODE
--]]

-- Move text
keymap('x','J', ":move '>+1<cr>gv-gv", opts)
keymap('x','K', ":move '<-2<cr>gv-gv", opts)
keymap('x','<a-j>', ":move '>+1<cr>gv-gv", opts)
keymap('x','<a-k>', ":move '<-2<cr>gv-gv", opts)

--[[
    TERMINAL MODE
--]]

-- Terminal navigation
-- keymap('t', '<c-h>', '<c-\\><c-N><c-w>h', silent)
-- keymap('t', '<c-j>', '<c-\\><c-N><c-w>j', silent)
-- keymap('t', '<c-k>', '<c-\\><c-N><c-w>k', silent)
-- keymap('t', '<c-l>', '<c-\\><c-N><c-w>l', silent)

--[[
    COMMAND MODE
--]]
