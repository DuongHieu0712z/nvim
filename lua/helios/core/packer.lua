local M = {}

M.first_install = false

M.bootstrap = function()
    local fn = vim.fn
    local cmd = vim.cmd

    local packer_ok, packer = pcall(require, 'packer')

    if not packer_ok then
        local packer_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

        print 'Cloning packer...'
        fn.system {
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            packer_path
        }
        print 'Installing packer close and reopen Neovim...'

        cmd [[packadd packer.nvim]]

        packer_ok, packer = pcall(require, 'packer')
        if packer_ok then
            print 'Packer cloned successfully.'
            M.first_install = true
        else
            error("Couldn't clone packer!\n" ..
                'Packer path: ' .. packer_path .. '\n' ..
                packer)
        end
    end
end

M.options = {
    auto_clean = true,
    compile_on_sync = true,
    display = {
        open_fn = function()
            return require 'packer.util'.float { border = 'rounded' }
        end,
        prompt_border = 'rounded',
    },
    git = {
        clone_timeout = 800,
    },
    profile = {
        enable = true,
        threshold = 0.0001,
    },
}

M.run = function(plugins)
    local packer_ok, packer = pcall(require, 'packer')
    if not packer_ok then
        return
    end

    packer.init(M.options)
    packer.startup(function(use)
        for key, plugin in pairs(plugins) do
            if type(key) == 'string' and not plugin[1] then
                plugin[1] = key
            end
            use(plugin)
        end

        if M.first_install then
            packer.sync()
        end
    end)
end

return M
