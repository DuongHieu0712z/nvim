local fn = vim.fn
local cmd = vim.cmd

-- Get nvim data directory
local data_dir = fn.stdpath 'data' .. '/site'
local packer = '/pack/packer/start/packer.nvim'
local path = data_dir .. packer

-- Initial packer if it not exists
if fn.empty(fn.glob(path)) == 1 then
    packer_bootstrap = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        path
    }
    print 'Installing packer close and reopen Neovim...'
    cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require 'packer.util'.float { border = 'rounded' }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- Packer manage itself
    use 'wbthomason/packer.nvim'

    --[[ THEMES ]] --

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Themes
    use 'navarasu/onedark.nvim'

    -- Linebar
    use 'nvim-lualine/lualine.nvim'
    use { 'akinsho/bufferline.nvim', tag = 'v2.*' }

    --[[ LANGUAGES SERVER PROTOCOL ]] --

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'p00f/nvim-ts-rainbow'
    use 'windwp/nvim-ts-autotag'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'tamago324/nlsp-settings.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'antoinemadec/FixCursorHold.nvim'

    -- Schema store JSON
    use 'b0o/schemastore.nvim'

    -- Cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lua'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- DAP
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'rcarriga/nvim-dap-ui'
    use 'Pocco81/DAPInstall.nvim'

    --[[ REFACTORING ]] --

    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- Indent
    use 'lukas-reineke/indent-blankline.nvim'

    -- Illuminate
    use 'RRethy/vim-illuminate'

    -- Auto pairs
    use 'windwp/nvim-autopairs'

    -- Renamer
    use { 'filipdutescu/renamer.nvim', branch = 'master', }

    -- Surround
    use 'Mephistophiles/surround.nvim'

    --[[ UTILITIES ]] --

    -- Dashboard
    use 'goolord/alpha-nvim'

    -- Notify
    use 'rcarriga/nvim-notify'

    -- Popup
    use 'nvim-lua/popup.nvim'

    -- Nvim tree
    use { 'kyazdani42/nvim-tree.lua', tag = 'nightly' }

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- Terminal
    use 'voldikss/vim-floaterm'
    use { 'akinsho/toggleterm.nvim', tag = 'v1.*' }

    -- Gitsigns
    use { 'lewis6991/gitsigns.nvim', tag = 'release' }

    --Project
    use 'ahmedkhalf/project.nvim'

    -- Comment
    use 'numToStr/Comment.nvim'
    use 'folke/todo-comments.nvim'

    -- Navigator
    use 'christoomey/vim-tmux-navigator'

    -- Scroll
    use 'karb94/neoscroll.nvim'

    -- Which key
    use 'folke/which-key.nvim'

    -- Cache
    use 'dstein64/vim-startuptime'
    use 'lewis6991/impatient.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        packer.sync()
    end
end)
