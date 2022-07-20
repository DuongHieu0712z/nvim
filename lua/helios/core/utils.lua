local M = {}

local autocmd = vim.api.nvim_create_autocmd

M.merge_table = function(...)
    return vim.tbl_deep_extend('force', ...)
end

M.lazy_load = function(tb)
    -- print('setup ')
    autocmd(tb.events, {
        pattern = '*',
        callback = function()
            if tb.condition() then
                vim.api.nvim_del_augroup_by_name(tb.augroup_name)
                if tb.plugins ~= 'nvim-treesitter' then
                    vim.defer_fn(function()
                        vim.cmd('PackerLoad ' .. tb.plugins)
                    end, 0)
                else
                    vim.cmd('PackerLoad ' .. tb.plugins)
                end
            end
            print('setup ' .. tb.augroup_name)
        end,
        group = vim.api.nvim_create_augroup(tb.augroup_name, { clear = true }),
    })
end

M.on_file_open = function(plugin_name)
    M.lazy_load {
        events = { 'BufRead', 'BufWinEnter', 'BufNewFile' },
        augroup_name = 'BeLazyOnFileOpen' .. plugin_name,
        plugins = plugin_name,
        condition = function()
            local file = vim.fn.expand '%'
            return file ~= 'NvimTree_1' and file ~= '[packer]' and file ~= ''
        end,
    }
end

M.load_mappings = function(mappings, mapping_opts)
    local map_func
    local ok, which_key = pcall(require, 'which-key')

    if ok then
        map_func = function(keybind, mapping_info, opts)
            which_key.register({ [keybind] = mapping_info }, opts)
        end
    else
        map_func = function(keybind, mapping_info, opts)
            local mode = opts.mode
            opts.mode = nil
            vim.keymap.set(mode, keybind, mapping_info[1], opts)
        end
    end

    for _, section_mappings in pairs(mappings) do
        for mode, mode_mappings in pairs(section_mappings) do
            for keybind, mapping_info in pairs(mode_mappings) do
                local opts = {
                    mode = mode,
                    silent = true,
                    noremap = true,
                    nowait = true,
                }
                opts = M.merge_table(opts, mapping_opts or {})
                opts = M.merge_table(opts, mapping_info.opts or {})

                if mapping_info.opts then
                    mapping_info.opts = nil
                end

                map_func(keybind, mapping_info, opts)
            end
        end
    end
end

M.set_highlight = function(name, val)
    vim.api.nvim_set_hl(0, name, val)
end

return M
