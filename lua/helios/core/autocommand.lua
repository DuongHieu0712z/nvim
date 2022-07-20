local api = vim.api
local cmd = vim.cmd
local opt = vim.opt_local
local autocmd = api.nvim_create_autocmd

autocmd('BufWritePost', {
    pattern = 'load.lua',
    command = [[source <afile> | PackerCompile]],
})

autocmd('User', {
    pattern = 'AlphaReady',
    command = [[set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3]],
})

autocmd('FileType', {
    pattern = { 'qf', 'help', 'man', 'lspinfo', 'lir' },
    callback = function()
        cmd = [[nnoremap <silent><buffer> q :close<cr>]]
        opt.buflisted = false
    end,
})

autocmd('BufEnter', {
    pattern = '',
    callback = function()
        local buf_ft = vim.bo.filetype
        if buf_ft == '' or buf_ft == nil then
            cmd [[
                nnoremap <silent><buffer> q :close<cr>
                nnoremap <silent><buffer> <c-j> j<cr>
                nnoremap <silent><buffer> <c-k> k<cr>
            ]]
            opt.buflisted = false
        end
    end,
})

-- autocmd('BufEnter', {
--     pattern = 'term://*',
--     callback = function()
--         cmd 'startinsert!'
--         cmd 'set cmdheight=1'
--     end,
-- })

autocmd('FileType', {
    pattern = { 'gitcommit', 'markdown' },
    callback = function()
        opt.wrap = true
        opt.spell = true
    end,
})

autocmd('FileType', {
    pattern = 'lir',
    callback = function()
        opt.number = false
        opt.relativenumber = false
    end,
})

cmd [[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_'.tabpagenr() | quit | endif]]
-- autocmd('BufEnter', {
--     pattern = '*',
--     command = [[if winnr('$') == 1 && bufname() == 'NvimTree_'.tabpagenr() | quit | endif]],
-- })

autocmd('VimResized', {
    pattern = '*',
    command = [[tabdo wincmd =]],
})

autocmd('CmdWinEnter', {
    pattern = '*',
    command = [[quit]],
})

autocmd('BufWinEnter', {
    pattern = '*',
    command = [[set formatoptions-=cro]],
})

autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
    end,
})

autocmd('BufWritePost', {
    pattern = '*.java',
    callback = function()
        vim.lsp.codelens.refresh()
    end
})

autocmd('VimEnter', {
    pattern = '*',
    command = [[hi link illuminatedWord LspReferenceText]],
})

autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        vim.lsp.buf.formatting_sync(nil, 1000)
    end,
})

cmd [[au FocusGained,BufEnter * :checktime]]
