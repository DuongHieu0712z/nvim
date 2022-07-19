local g = vim.g
local opt = vim.opt
local cmd = vim.cmd


cmd [[syntax on]]

cmd [[filetype on]]
cmd [[filetype indent on]]
cmd [[filetype plugin on]]
cmd [[filetype plugin indent on]]


vim.api.nvim_set_keymap('', '<space>', '<nop>', {
    silent  = true,
    noremap = true,
    nowait  = true,
})

local g_opts = {
    mapleader            = ' ',
    maplocalleader       = ' ',
    do_filetype_lua      = 1,
    did_load_filetypes   = 0,
    neovide_transparency = 0.9,
}

for key, value in pairs(g_opts) do
    g[key] = value
end


local icons = require 'helios.theme.icons'

local opts = {
    -- Encoding utf-8
    encoding     = 'utf-8',
    fileencoding = 'utf-8',

    -- Color and background
    termguicolors = true,
    background    = 'dark',
    colorcolumn   = '99999',
    guifont       = 'CaskaydiaCove NF:h12',

    -- Line number
    number         = true,
    relativenumber = true,
    signcolumn     = 'yes',

    -- Ruler and cursor
    ruler        = true,
    cursorbind   = false, -- Bind cursor in diff mode
    cursorline   = false,
    cursorcolumn = false,

    -- Title
    title       = false,
    titlestring = 'NeoVim: %t%a%r%m %=%l/%L-%P ',

    -- Wrap line
    wrap      = true,
    showbreak = icons.others.showbreak,

    -- Search
    hlsearch   = true,
    ignorecase = true,
    smartcase  = true,
    wildmenu   = true,
    wildignore = { '*/node_modules/*', '*/.git/*', '*/vendor/*' },

    -- Display list mode
    list      = true,
    listchars = icons.listchars,

    -- Backup
    backup      = false,
    writebackup = false,
    swapfile    = false,
    undodir     = vim.fn.stdpath 'cache' .. '/undo',
    undofile    = true,

    -- Clipboard
    clipboard = 'unnamedplus',

    -- Fold
    -- foldmethod = 'manual',
    -- foldexpr   = '',

    -- Spell
    -- spell     = false,
    -- spelllang = 'en',

    -- Scroll
    scrolloff     = 8,
    sidescrolloff = 8,

    -- Split
    splitbelow = true,
    splitright = true,

    -- Height
    cmdheight = 2,
    pumheight = 8,

    -- Perfomance
    redrawtime  = 1000,
    timeoutlen  = 250,
    ttimeoutlen = 100,
    updatetime  = 100,

    -- Indent
    autoindent     = true,
    preserveindent = true,
    smartindent    = true,
    expandtab      = true,
    smarttab       = true,
    tabstop        = 4,
    shiftwidth     = 4,
    softtabstop    = 4,

    -- Other
    showcmd     = true, -- Show command
    showmode    = false, -- Show mode
    showtabline = 0, -- Show tabline

    mouse       = 'a',
    completeopt = { 'menu', 'menuone', 'noselect' },
    matchpairs  = { '(:)', '{:}', '[:]', '<:>' },
}

for key, value in pairs(opts) do
    opt[key] = value
end

opt.backspace:append 'nostop'
opt.iskeyword:append '-'
opt.shortmess:append 'csI'
opt.whichwrap:append '<,>,[,],h,l'
