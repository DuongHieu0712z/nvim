-- vim.cmd [[
--     augroup packer_user_config
--         autocmd!
--         autocmd BufWritePost helios/plugins/init.lua source <afile> | PackerCompile
--     augroup end
-- ]]

local utils = require 'helios.core.utils'

-- local require = function(module)
--     local ok, _ = pcall(require, module)
--     if ok then
--         print(module .. ' ok')
--     end
-- end

local plugins = {
    -- Plugin manager
    ['wbthomason/packer.nvim'] = {},

    -- Optimizer
    ['lewis6991/impatient.nvim'] = {},

    -- Lua functions
    ['nvim-lua/plenary.nvim'] = { module = 'plenary' },

    -- Popup API
    ['nvim-lua/popup.nvim'] = {},

    -- Notification enhancer
    ['rcarriga/nvim-notify'] = {
        event = 'VimEnter',
        config = function()
            require 'helios.plugins.configs.notify'
        end,
    },

    -- Neovim UI enhancer
    ['MunifTanjim/nui.nvim'] = { module = 'nui' },

    -- Smarter Splits
    ['mrjones2014/smart-splits.nvim'] = {
        module = 'smart-splits',
        config = function()
            require 'helios.plugins.configs.smart-splits'
        end,
    },

    -- Cursorhold fix
    ['antoinemadec/FixCursorHold.nvim'] = {
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            vim.g.cursorhold_updatetime = 100
        end,
    },

    -- Color highlighting
    ['norcalli/nvim-colorizer.lua'] = {
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require 'helios.plugins.configs.colorizer'
        end,
    },

    -- Icons
    ['kyazdani42/nvim-web-devicons'] = { module = 'nvim-web-devicons' },

    -- Theme
    ['navarasu/onedark.nvim'] = {
        config = function()
            require 'helios.plugins.configs.theme'
        end,
    },

    -- Lualine
    ['nvim-lualine/lualine.nvim'] = {
        after = 'nvim-web-devicons',
        config = function()
            require 'helios.plugins.configs.lualine'
        end,
    },

    -- Bufferline
    ['akinsho/bufferline.nvim'] = {
        after = 'nvim-web-devicons',
        config = function()
            require 'helios.plugins.configs.bufferline'
        end,
    },

    -- Dashboard
    ['goolord/alpha-nvim'] = {
        config = function()
            require 'helios.plugins.configs.alpha'
        end,
    },

    -- Treesitter
    ['nvim-treesitter/nvim-treesitter'] = {
        module = 'nvim-treesitter',
        run = 'TSUpdate',
        event = { 'BufRead', 'BufNewFile' },
        cmd = {
            'TSInstall',
            'TSInstallInfo',
            'TSInstallSync',
            'TSUninstall',
            'TSUpdate',
            'TSUpdateSync',
            'TSEnableAll',
            'TSDisableAll',
            'TSBufEnable',
            'TSBufDisable',
            'TSEnable',
            'TSDisable',
            'TSModuleInfo',
        },
        -- setup = function() utils.on_file_open 'nvim-treesitter' end,
        config = function()
            require 'helios.plugins.configs.treesitter'
        end,
    },
    ['nvim-treesitter/nvim-treesitter-context'] = { after = 'nvim-treesitter' },
    ['nvim-treesitter/nvim-treesitter-refactor'] = { after = 'nvim-treesitter' },
    ['JoosepAlviste/nvim-ts-context-commentstring'] = { after = 'nvim-treesitter' },
    ['p00f/nvim-ts-rainbow'] = { after = 'nvim-treesitter' },
    ['windwp/nvim-ts-autotag'] = { after = 'nvim-treesitter' },

    -- Language server protocol
    ['williamboman/nvim-lsp-installer'] = {
        opt = true,
        cmd = '',
        -- setup = function() utils.on_file_open 'nvim-lsp-installer' end,
    },
    ['neovim/nvim-lspconfig'] = {
        after = 'nvim-lsp-installer',
        module = 'lspconfig',
        config = function()
            require 'helios.plugins.configs.lsp'
        end,
    },
    ['jose-elias-alvarez/null-ls.nvim'] = {},
    ['stevearc/aerial.nvim'] = {
        module = 'aerial',
        cmd = { 'AerialToggle', 'AerialOpen', 'AerialInfo' },
        config = function()
            require 'helios.plugins.configs.aerial'
            require 'telescope'.load_extension 'aerial'
        end,
    },

    -- Autocompletion + Snippets
    ['rafamadriz/friendly-snippets'] = {
        module = 'cmp_nvim_lsp',
        event = 'InsertEnter',
    },
    ['hrsh7th/nvim-cmp'] = {
        after = 'friendly-snippets',
        config = function()
            require 'helios.plugins.configs.cmp'
        end,
    },
    ['L3MON4D3/LuaSnip'] = {
        wants = 'friendly-snippets',
        after = 'nvim-cmp',
        config = function()
            require 'helios.plugins.configs.luasnip'
        end,
    },
    ['saadparwaiz1/cmp_luasnip'] = { after = 'LuaSnip' },
    ['hrsh7th/cmp-nvim-lsp'] = { after = 'cmp_luasnip' },
    ['hrsh7th/cmp-nvim-lua'] = { after = 'cmp_luasnip' },
    ['hrsh7th/cmp-buffer'] = { after = 'cmp_luasnip' },
    ['hrsh7th/cmp-path'] = { after = 'cmp_luasnip' },
    ['hrsh7th/cmp-cmdline'] = { after = 'cmp_luasnip' },

    -- Debug adapter protocol

    -- File explorer
    ['kyazdani42/nvim-tree.lua'] = {
        ft = 'alpha',
        cmd = {
            'NvimTreeToggle',
            'NvimTreeFocus',
        },
        config = function()
            require 'helios.plugins.configs.nvimtree'
        end,
    },

    -- Git signs
    ['lewis6991/gitsigns.nvim'] = {
        event = 'BufEnter',
        config = function()
            require 'helios.plugins.configs.gitsigns'
        end,
    },

    -- Telescope
    ['nvim-telescope/telescope.nvim'] = {
        module = 'telescope',
        cmd = 'Telescope',
        config = function()
            require 'helios.plugins.configs.telescope'
        end,
    },
    ['nvim-telescope/telescope-fzf-native.nvim'] = {
        after = 'telescope.nvim',
        run = 'make',
        config = function()
            require 'telescope'.load_extension 'fzf'
        end,
    },
    ['nvim-telescope/telescope-fzy-native.nvim'] = {
        after = 'telescope.nvim',
        config = function()
            require 'telescope'.load_extension 'fzy_native'
        end,
    },

    -- Project
    ['ahmedkhalf/project.nvim'] = {
        after = 'telescope.nvim',
        config = function()
            require 'helios.plugins.configs.project'
            require 'telescope'.load_extension 'projects'
        end,
    },

    -- Illuminate
    ['RRethy/vim-illuminate'] = {
        config = function()
            require 'helios.plugins.configs.illuminate'
        end,
    },

    -- Terminal
    ['voldikss/vim-floaterm'] = {
        config = function()
            require 'helios.plugins.configs.floaterm'
        end,
    },
    ['akinsho/toggleterm.nvim'] = {
        config = function()
            require 'helios.plugins.configs.toggleterm'
        end,
    },

    -- Get extra JSON schemas
    ['b0o/SchemaStore.nvim'] = { module = 'schemastore' },

    -- Auto pairs
    ['windwp/nvim-autopairs'] = {
        after = 'nvim-cmp',
        event = 'InsertEnter',
        config = function()
            require 'helios.plugins.configs.autopairs'
        end,
    },

    -- Surround
    ['Mephistophiles/surround.nvim'] = {
        config = function()
            require 'helios.plugins.configs.surround'
        end,
    },

    -- Comment
    ['numToStr/Comment.nvim'] = {
        module = { 'Comment', 'Comment.api' },
        event = { 'BufRead', 'BufWinEnter' },
        config = function()
            require 'helios.plugins.configs.comment'
        end,
    },
    ['folke/todo-comments.nvim'] = {
        event = 'BufWinEnter',
        after = 'plenary.nvim',
        config = function()
            require 'helios.plugins.configs.todo-comment'
        end,
    },

    -- Indent detection
    ['Darazaki/indent-o-matic'] = {
        event = 'BufReadPost',
        config = function()
            require 'helios.plugins.configs.indent-o-matic'
        end,
    },

    -- Guess indent
    ['nmac427/guess-indent.nvim'] = {
        config = function()
            require 'helios.plugins.configs.guess-indent'
        end,
    },

    -- Indent blankline
    ['lukas-reineke/indent-blankline.nvim'] = {
        opt = true,
        event = 'BufRead',
        -- setup = function() utils.on_file_open 'indent-blankline.nvim' end,
        config = function()
            require 'helios.plugins.configs.indent-blankline'
        end,
    },

    -- Smooth scrolling
    ['declancm/cinnamon.nvim'] = {
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require 'helios.plugins.configs.cinnamon'
        end,
    },

    -- Smooth escaping
    ['max397574/better-escape.nvim'] = {
        event = 'InsertCharPre',
        config = function()
            require 'helios.plugins.configs.better-escape'
        end,
    },

    -- Whichkey
    ['folke/which-key.nvim'] = {
        module = 'which-key',
        config = function()
            require 'helios.plugins.configs.whichkey'
        end,
    },
}

require 'helios.core.packer'.run(plugins)

-- require 'helios.plugins.configs.lsp'
