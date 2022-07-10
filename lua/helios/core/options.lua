local g = vim.g
local opt = vim.opt
local cmd = vim.cmd


g.neovide_transparency = 0.9
g.toggle_theme_icon = '  '
g.transparency = true
g.theme_switcher_loaded = false


g.did_load_filetypes = 0
g.do_filetype_lua = 1

vim.api.nvim_set_keymap('', '<space>', '<nop>', {
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
})
g.mapleader = ' '
g.maplocalleader = ' '

local opts = {
    -- Encoding utf-8
    encoding = 'utf-8',
    fileencoding = 'utf-8',

    -- Color and background
    termguicolors = true,
    background = 'dark',
    guifont = 'CaskaydiaCove NF:h12',
    colorcolumn = '99999',

    -- Line number
    number = true,
    relativenumber = true,
    signcolumn = 'yes',

    -- Ruler and cursor
    ruler = true,
    cursorbind = false, -- Bind cursor in diff mode
    cursorline = false,
    cursorcolumn = false,

    -- Title
    title = true,
    titlestring = 'NeoVim: %t%a%r%m %=%l/%L-%P ',

    -- Wrap line
    wrap = true,
    showbreak = '↪↪',

    -- Search
    hlsearch = true,
    ignorecase = true,
    smartcase = true,

    -- Display list mode
    list = true,
    listchars = {
        eol = '↩', -- end of line
        tab = '▸·', -- tab
        space = '·', -- space
        trail = '·', -- trailing space
        extends = '⯈', -- in last column, when wrap line is off and line continues
        precedes = '⯇', -- in first column, when wrap line is off and character visible in first column
        conceal = ' ', -- show in place of concealed text, when 'conceallevel' is set to 1
        nbsp = '⌴', -- non-breakable space
    },

    -- Backup
    backup = false,
    writebackup = false,
    swapfile = false,
    undodir = vim.fn.stdpath 'cache' .. '/undo',
    undofile = true,
    updatetime = 300,

    -- Clipboard
    clipboard = 'unnamedplus',

    -- Fold
    -- foldmethod = 'manual',
    -- foldexpr = '',

    -- Spell
    -- spell = false,
    -- spelllang = 'en',

    -- Scroll
    scrolloff = 8,
    sidescrolloff = 8,

    -- Split
    splitbelow = true,
    splitright = true,

    -- Height
    cmdheight = 2,
    pumheight = 8,

    -- Time
    ttimeoutlen = 100,

    -- Indent
    autoindent = true,
    smartindent = true,
    expandtab = true,
    smarttab = true,
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,

    -- Other
    showcmd = true, -- Show command
    showmode = false, -- Show mode
    showtabline = 2, -- Show tab line

    mouse = 'a',
    completeopt = { 'menuone', 'noselect' },
}

for key, value in pairs(opts) do
    opt[key] = value
end

opt.shortmess:append 'c'
opt.whichwrap:append '<>[]hl'
opt.iskeyword:append '-'


cmd [[syntax on]]

cmd [[filetype on]]
cmd [[filetype indent on]]
cmd [[filetype plugin on]]
cmd [[filetype plugin indent on]]

-- cmd [[autocmd FileType html,css,scss,javascript,javascriptreact,typescript,typescriptreact,json,xml,yaml set tabstop=2 shiftwidth=2 softtabstop=2]]
