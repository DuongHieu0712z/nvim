local status_ok, navic = pcall(require, 'nvim-navic')
if not status_ok then
    return
end

local kind_icons = require 'helios.theme.icons'.kind_icons

navic.setup {
    icons = kind_icons,
    highlight = true,
    separator = ' > ',
    depth_limit = 0,
    depth_limit_indicator = '…',
}


local utils  = require 'helios.core.utils'
local colors = require 'helios.theme.colors'

local merge_tb = utils.merge_table
local set_hl   = utils.set_highlight

local navic_hl = colors.navic
for k, v in pairs(navic_hl) do
    if type(v) == 'string' then
        v = { fg = v }
    end
    v = merge_tb(v, { default = true })
    set_hl('NavicIcons' .. k, v)
end

set_hl('NavicText', {
    default = true,
    fg = '#a0a8b7',
    italic = true,
})
set_hl('NavicSeparator', {
    default = true,
    fg = '#a0a8b7',
})
