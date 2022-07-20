require 'helios.core.options'

require 'helios.load'

local mappings = require 'helios.core.mappings'.mappings
vim.defer_fn(function()
    require 'helios.core.utils'.load_mappings(mappings)
end, 0)

require 'helios.core.autocommand'
