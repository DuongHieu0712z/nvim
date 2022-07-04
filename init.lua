-- ██╗███╗░░██╗██╗████████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██║████╗░██║██║╚══██╔══╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║██╔██╗██║██║░░░██║░░░░░░██║░░░░░██║░░░██║███████║
-- ██║██║╚████║██║░░░██║░░░░░░██║░░░░░██║░░░██║██╔══██║
-- ██║██║░╚███║██║░░░██║░░░██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝


-- Main
require 'options'
require 'keymaps'
require 'plugins'

-- Themes
require 'plugins.theme'
require 'plugins.lualine'
require 'plugins.bufferline'

-- Utilities
require 'plugins.dashboard'
require 'plugins.notify'
require 'plugins.impatient'
require 'plugins.nvimtree'
require 'plugins.telescope'
require 'plugins.floaterm'
require 'plugins.toggleterm'
require 'plugins.gitsigns'
require 'plugins.project'
require 'plugins.comment'
require 'plugins.scroll'
require 'plugins.whichkey'

-- Languages server protocol
require 'plugins.treesitter'
require 'plugins.cmp'
require 'plugins.lsp'
require 'plugins.dap'

-- Refactoring
require 'plugins.colorizer'
require 'plugins.illuminate'
require 'plugins.indent'
require 'plugins.autopairs'
require 'plugins.renamer'
require 'plugins.surround'

-- Auto command
require 'plugins.autocommand'

-- Colors
require 'colors'

-- Neovide
require 'neovide'
