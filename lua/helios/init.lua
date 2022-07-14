require 'helios.core.options'

require 'helios.core.packer'.bootstrap()
require 'helios.plugins'

local mappings = require 'helios.core.mappings'.mappings
local opts = require 'helios.core.mappings'.opts
vim.defer_fn(function()
    require 'helios.core.utils'.load_mappings(mappings, opts)
end, 0)

require 'helios.core.autocommand'
-- require 'helios.theme.colors'
