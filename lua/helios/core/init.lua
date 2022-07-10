local api = vim.api
local autocmd = api.nvim_create_autocmd

-- Don't list quickfix buffers
autocmd('FileType', {
    pattern = 'qf',
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

-- Wrap the PackerSync command to warn people before using it

-- Disable status line in dashboard
autocmd('FileType', {
    pattern = 'alpha,dashboard',
    callback = function()
        vim.opt.laststatus = 0
    end,
})

autocmd('BufUnload', {
    buffer = 0,
    callback = function()
        vim.opt.laststatus = 0
    end,
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
    pattern = '*',
    command = 'set fo-=c fo-=r fo-=o',
})

vim.t.bufs = api.nvim_list_bufs()

autocmd({ 'BufAdd', 'BufEnter' }, {
    callback = function(args)
        if vim.t.bufs == nil then
            vim.t.bufs = { args.buf }
        else
            local bufs = vim.t.bufs
            if not vim.tbl_contains(bufs, args.buf) and (args.event == 'BufAdd' or vim.bo[args.buf].buflisted) then
                table.insert(bufs, args.buf)
                vim.t.bufs = bufs
            end
        end
    end,
})

autocmd('BufDelete', {
    callback = function(args)
        for _, tab in ipairs(api.nvim_list_tabpages()) do
            local bufs = vim.t[tab].bufs
            if bufs then
                for i, bufnr in ipairs(bufs) do
                    if bufnr == args.buf then
                        table.remove(bufs, i)
                        vim.t[tab].bufs = bufs
                        break
                    end
                end
            end
        end
    end,
})

require 'helios.core.options'

local mappings = require 'helios.core.mappings'.mappings
local opts = require 'helios.core.mappings'.opts
require 'helios.core.utils'.load_mappings(mappings, opts)

require 'helios.core.packer'.bootstrap()
