local M = {}

M.opts = {
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

M.mappings = {}

M.mappings.general = {
    n = {
        ['<esc>'] = { '<cmd>noh<cr>', ' No highlight' },

        -- Edit and refresh file init.lua
        ['<leader>ve'] = { '<cmd>edit $MYVIMRC<cr>', ' Edit file neovim config' },
        ['<leader>vr'] = { '<cmd>source $MYVIMRC<cr>', ' Refresh neovim' },

        -- Save and exit
        ['<leader>w'] = { '<cmd>w<cr>', ' Save file' },
        ['<leader>q'] = { '<cmd>q<cr>', ' Exit' },
        ['<c-s>']     = { '<cmd>w!<cr>', ' Force save' },
        ['<c-q>']     = { '<cmd>q!<cr>', ' Force quit' },

        -- Window navigation
        ['<c-h>'] = { '<c-w>h', ' Window left' },
        ['<c-j>'] = { '<c-w>j', ' Window down' },
        ['<c-k>'] = { '<c-w>k', ' Window up' },
        ['<c-l>'] = { '<c-w>l', ' Window right' },

        -- Buffer navigation
        ['<s-h>'] = { '<cmd>bprevious<cr>', ' Buffer left' },
        ['<s-l>'] = { '<cmd>bnext<cr>', ' Buffer right' },
        ['<s-q>'] = { '<cmd>bdelete!<cr>', '﯇ Close buffer' },

        -- Resize split
        ['<c-up>']    = { '<cmd>resize -2<cr>', 'Resize split up' },
        ['<c-down>']  = { '<cmd>resize +2<cr>', 'Resize split down' },
        ['<c-left>']  = { '<cmd>vertical resize -2<cr>', 'Resize split left' },
        ['<c-right>'] = { '<cmd>vertical resize +2<cr>', 'Resize split right' },

        -- Move text
        ['<a-j>'] = { '<cmd>move .+1<cr>==gi', '' },
        ['<a-k>'] = { '<cmd>move .-2<cr>==gi', '' },
    },
    i = {
        -- Fast return normal mode
        ['jk'] = { '<esc>', ' Return to Normal mode' },

        -- Save
        ['<c-s>'] = { '<esc><cmd>w<cr>', ' Save file' },

        -- Go to beginning or end of line
        ['<c-b>'] = { '<esc>I', '論 Beginning of line' },
        ['<c-e>'] = { '<esc>A', '壟 End of line' },
        ['<c-o>'] = { '<esc>o', 'Add new line under current line' },
        ['<c-u>'] = { '<esc>O', 'Add new line over current line' },

        -- Navigation
        ['<c-h>'] = { '<left>', ' Move left' },
        ['<c-j>'] = { '<down>', ' Move down' },
        ['<c-k>'] = { '<up>', ' Move up' },
        ['<c-l>'] = { '<right>', ' Move right' },

        ['<a-left>']  = { [[<c-\><c-n><c-w>h]], '' },
        ['<a-down>']  = { [[<c-\><c-n><c-w>j]], '' },
        ['<a-up>']    = { [[<c-\><c-n><c-w>k]], '' },
        ['<a-right>'] = { [[<c-\><c-n><c-w>l]], '' },

        -- Move text
        ['<a-j>'] = { '<cmd>move .+1<cr>==gi', '' },
        ['<a-k>'] = { '<cmd>move .-2<cr>==gi', '' },
    },
    t = {
        ['<esc>'] = { [[<c-\><c-n>]], 'Terminal normal mode' },
        ['jk']    = { [[<c-\><c-n>]], 'Terminal normal mode' },

        -- Window navigation
        ['<c-h>'] = { [[<c-\><c-n><c-w>h]], 'Terminal left window navigation' },
        ['<c-j>'] = { [[<c-\><c-n><c-w>j]], 'Terminal down window navigation' },
        ['<c-k>'] = { [[<c-\><c-n><c-w>k]], 'Terminal up window navigation' },
        ['<c-l>'] = { [[<c-\><c-n><c-w>l]], 'Terminal right window navigation' },
    },
    v = {
        -- Stay in indent mode
        ['<'] = { '<gv', 'Unindent line' },
        ['>'] = { '>gv', 'Indent line' },

        -- Move text
        ['<a-j>'] = { '<cmd>move .+1<cr>==gi', '' },
        ['<a-k>'] = { '<cmd>move .-2<cr>==gi', '' },
    },
    x = {
        -- Move text
        ['J']     = { ":move '>+1<cr>gv-gv", '' },
        ['K']     = { ":move '<-2<cr>gv-gv", '' },
        ['<a-j>'] = { ":move '>+1<cr>gv-gv", '' },
        ['<a-k>'] = { ":move '<-2<cr>gv-gv", '' },
    },
    c = {},
}

M.mappings.packer = {
    n = {
        ['<leader>pc'] = { '<cmd>PackerCompile<cr>', 'Packer compile' },
        ['<leader>pi'] = { '<cmd>PackerInstall<cr>', 'Packer install' },
        ['<leader>ps'] = { '<cmd>PackerSync<cr>', 'Packer sync' },
        ['<leader>pS'] = { '<cmd>PackerStatus<cr>', 'Packer status' },
        ['<leader>pu'] = { '<cmd>PackerUpdate<cr>', 'Packer update' },
    },
}

M.mappings.nvimtree = {
    n = {
        ['<leader>e'] = { '<cmd>NvimTreeToggle<cr>', 'פּ Toggle nvimtree' },
        ['<leader>o'] = { '<cmd>NvimTreeFocus<cr>', 'פּ Focus nvimtree' },
    },
}

M.mappings.telescope = {
    n = {
        ['<c-p>']      = { '<cmd>Telescope find_files<cr>', ' Find files' },
        ['<leader>ff'] = { '<cmd>Telescope find_files<cr>', ' Find files' },
        ['<leader>fF'] = { '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>', ' Find all files' },

        ['<leader>fw'] = { '<cmd>Telescope live_grep<cr>', ' Search words' },
        ['<leader>fW'] = {
            function()
                require 'telescope'.live_grep {
                    additional_args = function(args)
                        return vim.list_extend(args, {
                            '--hidden',
                            '--no-ignore',
                        })
                    end
                }
            end,
            ' Search words in all files',
        },

        ['<leader>fb'] = { '<cmd>Telescope buffers<cr>', ' Search buffers' },
        ['<leader>fm'] = { '<cmd>Telescope marks<cr>', ' Search marks' },
        ['<leader>fo'] = { '<cmd>Telescope oldfiles<cr>', ' Search history' },

        ['<leader>fk'] = { '<cmd>Telescope keymaps<cr>', ' Search keymaps' },
        ['<leader>fr'] = { '<cmd>Telescope registers<cr>', ' Search registers' },
        ['<leader>fc'] = { '<cmd>Telescope commands<cr>', 'גּ Search commands' },

        ['<leader>sh'] = { '<cmd>Telescope help_tags<cr>', ' Search help' },
        ['<leader>sm'] = { '<cmd>Telescope man_pages<cr>', ' Search man' },

        ['<leader>sb'] = { '<cmd>Telescope git_branches<cr>', ' Git branches' },
        ['<leader>sc'] = { '<cmd>Telescope git_commits<cr>', ' Git commits' },
        ['<leader>ss'] = { '<cmd>Telescope git_status<cr>', ' Git status' },

        ['<leader>ft'] = { '<cmd>Telescope terms<cr>', ' Pick hidden term' },

        ['<leader>th'] = { '<cmd>Telescope themes<cr>', ' Pick themes' },
    },
}

M.mappings.lsp = {
    n = {
        ['<leader>li'] = { '<cmd>LspInfo<cr>', 'LSP information' },
        ['<leader>lI'] = { '<cmd>LspInstallInfo<cr>', 'LSP installer' },
    },
}

M.mappings.gitsigns = {
    n = {
        ['<leader>gj'] = {
            function()
                require 'gitsigns'.next_hunk()
            end,
            'Next git hunk',
        },
        ['<leader>gk'] = {
            function()
                require 'gitsigns'.prev_hunk()
            end,
            'Previous git hunk',
        },
        ['<leader>gl'] = {
            function()
                require 'gitsigns'.blame_line()
            end,
            'View git blame',
        },
        ['<leader>gp'] = {
            function()
                require 'gitsigns'.preview_hunk()
            end,
            'Preview git hunk',
        },
        ['<leader>gh'] = {
            function()
                require 'gitsigns'.reset_hunk()
            end,
            'Reset git hunk',
        },
        ['<leader>gr'] = {
            function()
                require 'gitsigns'.reset_buffer()
            end,
            'Reset git buffer',
        },
        ['<leader>gs'] = {
            function()
                require 'gitsigns'.stage_hunk()
            end,
            'Stage git hunk',
        },
        ['<leader>gu'] = {
            function()
                require 'gitsigns'.undo_stage_hunk()
            end,
            'Unstage git hunk',
        },
        ['<leader>gd'] = {
            function()
                require 'gitsigns'.diffthis()
            end,
            'View git diff',
        },
    },
}

M.mappings.illuminate = {
    n = {
        ['<a-n>'] = { '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', '' },
        ['<a-p>'] = { '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', '' },
    },
}

M.mappings.terminal = {}

M.mappings.comments = {
    n = {
        ['<c-/>'] = {
            function()
                require 'Comment.api'.toggle_current_linewise()
            end,
            'Toggle comment',
        },
    },
    v = {
        ['<c-/>'] = {
            function()
                require 'Comment.api'.toggle_linewise_op(vim.fn.visualmode())
            end,
            'Toggle comment',
        },
    },
}

M.mappings.splits = {
    n = {
        -- Window navigation
        ['<c-h>'] = {
            function()
                require 'smart-splits'.move_cursor_left()
            end,
            ' Window left',
        },
        ['<c-j>'] = {
            function()
                require 'smart-splits'.move_cursor_down()
            end,
            ' Window down',
        },
        ['<c-k>'] = {
            function()
                require 'smart-splits'.move_cursor_up()
            end,
            ' Window up',
        },
        ['<c-l>'] = {
            function()
                require 'smart-splits'.move_cursor_right()
            end,
            ' Window right',
        },

        -- Resize split
        ['<c-up>'] = {
            function()
                require 'smart-splits'.resize_up()
            end,
            'Resize split up',
        },
        ['<c-down>'] = {
            function()
                require 'smart-splits'.resize_down()
            end,
            'Resize split down',
        },
        ['<c-left>'] = {
            function()
                require 'smart-splits'.resize_left()
            end,
            'Resize split left',
        },
        ['<c-right>'] = {
            function()
                require 'smart-splits'.resize_right()
            end,
            'Resize split right',
        },
    },
}

M.mappings.whichkey = {
    n = {
        ['<leader>k'] = {
            function()
                vim.cmd 'WhichKey'
            end,
            ' Which-key all keymaps',
        },
        ['<leader>K'] = {
            function()
                local input = vim.fn.input 'WhichKey: '
                vim.cmd('WhichKey ' .. input)
            end,
            ' Which-key query lookup',
        },
    },
}

M.lsp_mappings = {}

M.lsp_mappings.general = {
    n = {
        ['gD'] = {
            function()
                vim.lsp.buf.declaration()
            end,
            ' LSP declaration',
        },
        ['gd'] = {
            function()
                vim.lsp.buf.definition()
            end,
            ' LSP definition',
        },
        ['gi'] = {
            function()
                vim.lsp.buf.implementation()
            end,
            ' LSP implementation',
        },
        ['gr'] = {
            function()
                vim.lsp.buf.references()
            end,
            ' LSP references',
        },

        ['K'] = {
            function()
                vim.lsp.buf.hover()
            end,
            ' LSP hover',
        },

        ['[d'] = {
            function()
                vim.diagnostic.goto_prev()
            end,
            ' Goto previous',
        },
        [']d'] = {
            function()
                vim.diagnostic.goto_next()
            end,
            ' Goto next',
        },

        ['<leader>ls'] = {
            function()
                vim.lsp.buf.signature_help()
            end,
            ' LSP signature help',
        },
        ['<leader>ld'] = {
            function()
                vim.lsp.buf.type_definition()
            end,
            ' LSP type definition',
        },
        ['<leader>la'] = {
            function()
                vim.lsp.buf.code_action()
            end,
            ' LSP code action',
        },
        ['<leader>lf'] = {
            function()
                vim.lsp.buf.formatting()
            end,
            ' LSP formatting',
        },
        ['<leader>lc'] = {
            function()
                vim.lsp.codelens.run()
            end,
            ' LSP code lens',
        },
        ['<leader>lr'] = {
            function()
                vim.lsp.buf.rename()
            end,
            ' LSP rename',
        },

        ['<leader>lA'] = {
            function()
                vim.lsp.buf.add_workspace_folder()
            end,
            ' Add workspace folder',
        },
        ['<leader>lR'] = {
            function()
                vim.lsp.buf.remove_workspace_folder()
            end,
            ' Remove workspace folder',
        },
        ['<leader>lL'] = {
            function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            ' List workspace folders',
        },

        ['<leader>df'] = {
            function()
                vim.diagnostic.open_float()
            end,
            ' Floating diagnostic',
        },
        ['<leader>dq'] = {
            function()
                vim.diagnostic.setloclist()
            end,
            ' Diagnostic setloclist',
        },
    },
}

M.aerial_mappings = {}

M.aerial_mappings.general = {
    n = {
        ['<leader>c'] = { '<cmd>AerialToggle!<cr>', '' },
        ['{']         = { '<cmd>AerialPrev<cr>', '' },
        ['}']         = { '<cmd>AerialNext<cr>', '' },
        ['[[']        = { '<cmd>AerialPrevUp<cr>', '' },
        [']]']        = { '<cmd>AerialNextUp<cr>', '' },
    },
}

-- local debug_mappings = {
--     ['<f9>'] = { '<cmd>lua require"dap".toggle_breakpoint()<cr>', 'Breakpoint' },
--     ['<f5>'] = { '<cmd>lua require"dap".continue()<cr>', 'Continue' },
--     ['<f11>'] = { '<cmd>lua require"dap".step_into()<cr>', 'Into' },
--     ['<f10>'] = { '<cmd>lua require"dap".step_over()<cr>', 'Over' },
--     ['<s-f11>'] = { '<cmd>lua require"dap".step_out()<cr>', 'Out' },
--     ['<f1>'] = { '<cmd>lua require"dap".repl.toggle()<cr>', 'Repl' },
--     ['<f3>'] = { '<cmd>lua require"dap".run_last()<cr>', 'Last' },
--     ['<f2>'] = { '<cmd>lua require"dapui".toggle()<cr>', 'UI' },
--     ['<f4>'] = { '<cmd>lua require"dap".terminate()<cr>', 'Exit' },
-- }

return M
