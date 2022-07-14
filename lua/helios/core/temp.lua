vim.cmd [[

    augroup _git
        autocmd!
        autocmd FileType gitcommit setlocal wrap
        autocmd FileType gitcommit setlocal spell
    augroup end

    augroup _markdown
        autocmd!
        autocmd FileType markdown setlocal wrap
        autocmd FileType markdown setlocal spell
    augroup end

    augroup _auto_resize
        autocmd!
        autocmd VimResized * tabdo wincmd = 
    augroup end

    augroup _alpha
        autocmd!
        autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
    augroup end
]]

-- Autoformat
-- vim.cmd [[
--     augroup _lsp
--         autocmd!
--         autocmd BufWritePre * lua vim.lsp.buf.formatting()
--     augroup end
-- ]]

vim.cmd [[autocmd BufWritePre * undojoin | lua vim.lsp.buf.formatting_sync()]]

local api = vim.api
local autocmd = api.nvim_create_autocmd

-- Wrap the PackerSync command to warn people before using it

-- Disable status line in dashboard
autocmd('FileType', {
    pattern = 'alpha,dashboard,startify',
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
