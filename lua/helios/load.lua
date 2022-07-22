local packer  = require 'helios.core.packer'
local plugins = require 'helios.plugins'

packer.bootstrap()
packer.load(plugins)

require 'helios.plugins.configs.lsp'
