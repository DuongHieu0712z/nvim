local M = {}

M.first_install = false

M.bootstrap = function()
    local fn = vim.fn
    local join_paths = require 'helios.core.utils'.join_paths

    local packer_ok, packer = pcall(require, 'packer')
    if not packer_ok then
        local packer_path = join_paths(fn.stdpath 'data', 'site', 'pack', 'packer', 'start', 'packer.nvim')

        print 'Cloning packer...'
        fn.system {
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            packer_path
        }
        print 'Installing packer... Close and reopen Neovim...'

        vim.cmd [[packadd packer.nvim]]
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
    ensure_dependencies  = true,
    auto_clean           = true,
    compile_on_sync      = true,
    auto_reload_compiled = true,
    autoremove           = true,
    -- opt_default          = true,

    -- snapshot_path = vim.fn.stdpath 'cache' .. '/packer.nvim',
    -- package_root = vim.fn.stdpath 'data' .. 'site/pack',
    -- compile_path = vim.fn.stdpath 'config' .. '/plugin/packer_compiled.lua',

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
        threshold = 1,
    },
}

M.load = function(plugins)
    vim.cmd [[packadd packer.nvim]]

    local packer_ok, packer = pcall(require, 'packer')
    if not packer_ok then
        return
    end

    packer.init(M.options)
    -- packer.reset()
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
    -- packer.compile()
end

return M
