local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 20,
        },

        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },

    icons = require 'helios.theme.icons'.whichkey,

    popup_mappings = {
        scroll_down = '<c-d>',
        scroll_up = '<c-u>',
    },

    window = {
        border = 'rounded',
        position = 'bottom',
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
    },

    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 4,
        align = 'left',
    },

    ignore_missing = true,
    hidden = { '<silent>', '<cmd>', '<Cmd>', '<cr>', 'call', 'lua', '^:', '^ ' },
    show_help = true,
    triggers = 'auto',
    triggers_blacklist = {
        i = { 'j', 'k' },
        v = { 'j', 'k' },
    },
}

which_key.setup(setup)



local mappings = {
    ['a'] = { '<cmd>Alpha<cr>', 'Alpha' },
    ['b'] = {
        '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown{previewer = false})<cr>',
        'Buffers',
    },
    ['e'] = { '<cmd>NvimTreeToggle<cr>', 'Explorer' },
    ['w'] = { '<cmd>w!<cr>', 'Save' },
    ['q'] = { '<cmd>q!<cr>', 'Quit' },
    ['c'] = { '<cmd>Bdelete!<cr>', 'Close Buffer' },
    ['h'] = { '<cmd>nohlsearch<cr>', 'No Highlight' },
    ['f'] = {
        '<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown{previewer = false})<cr>',
        'Find files',
    },
    ['F'] = { '<cmd>Telescope live_grep theme=ivy<cr>', 'Find Text' },
    ['P'] = { '<cmd>lua require("telescope").extensions.projects.projects()<cr>', 'Projects' },

    p = {
        name = 'Packer',
        c = { '<cmd>PackerCompile<cr>', 'Compile' },
        i = { '<cmd>PackerInstall<cr>', 'Install' },
        s = { '<cmd>PackerSync<cr>', 'Sync' },
        S = { '<cmd>PackerStatus<cr>', 'Status' },
        u = { '<cmd>PackerUpdate<cr>', 'Update' },
    },

    g = {
        name = 'Git',
        g = { '<cmd>lua _LAZYGIT_TOGGLE()<cr>', 'Lazygit' },
        j = { '<cmd>lua require "gitsigns".next_hunk()<cr>', 'Next Hunk' },
        k = { '<cmd>lua require "gitsigns".prev_hunk()<cr>', 'Prev Hunk' },
        l = { '<cmd>lua require "gitsigns".blame_line()<cr>', 'Blame' },
        p = { '<cmd>lua require "gitsigns".preview_hunk()<cr>', 'Preview Hunk' },
        r = { '<cmd>lua require "gitsigns".reset_hunk()<cr>', 'Reset Hunk' },
        R = { '<cmd>lua require "gitsigns".reset_buffer()<cr>', 'Reset Buffer' },
        s = { '<cmd>lua require "gitsigns".stage_hunk()<cr>', 'Stage Hunk' },
        u = {
            '<cmd>lua require "gitsigns".undo_stage_hunk()<cr>',
            'Undo Stage Hunk',
        },
        o = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
        b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
        c = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
        d = {
            '<cmd>Gitsigns diffthis HEAD<cr>',
            'Diff',
        },
    },

    l = {
        name = 'LSP',
        a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Action' },
        d = {
            '<cmd>Telescope lsp_document_diagnostics<cr>',
            'Document Diagnostics',
        },
        w = {
            '<cmd>Telescope lsp_workspace_diagnostics<cr>',
            'Workspace Diagnostics',
        },
        f = { '<cmd>lua vim.lsp.buf.formatting()<cr>', 'Format' },
        i = { '<cmd>LspInfo<cr>', 'Info' },
        I = { '<cmd>LspInstallInfo<cr>', 'Installer Info' },
        j = {
            '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>',
            'Next Diagnostic',
        },
        k = {
            '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>',
            'Prev Diagnostic',
        },
        l = { '<cmd>lua vim.lsp.codelens.run()<cr>', 'CodeLens Action' },
        q = { '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', 'Quickfix' },
        r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
        s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols' },
        S = {
            '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
            'Workspace Symbols',
        },
    },

    s = {
        name = 'Search',
        b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
        c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
        h = { '<cmd>Telescope help_tags<cr>', 'Find Help' },
        M = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
        r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
        R = { '<cmd>Telescope registers<cr>', 'Registers' },
        k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
        C = { '<cmd>Telescope commands<cr>', 'Commands' },
    },

    t = {
        name = 'Terminal',
        n = { '<cmd>lua _NODE_TOGGLE()<cr>', 'Node' },
        -- u = { '<cmd>lua _NCDU_TOGGLE()<cr>', 'NCDU' },
        -- t = { '<cmd>lua _HTOP_TOGGLE()<cr>', 'Htop' },
        p = { '<cmd>lua _PYTHON_TOGGLE()<cr>', 'Python' },
        f = { '<cmd>ToggleTerm direction=float<cr>', 'Float' },
        h = { '<cmd>ToggleTerm size=10 direction=horizontal<cr>', 'Horizontal' },
        v = { '<cmd>ToggleTerm size=80 direction=vertical<cr>', 'Vertical' },
    },
}

local debug_mappings = {
    ['<f9>'] = { '<cmd>lua require"dap".toggle_breakpoint()<cr>', 'Breakpoint' },
    ['<f5>'] = { '<cmd>lua require"dap".continue()<cr>', 'Continue' },
    ['<f11>'] = { '<cmd>lua require"dap".step_into()<cr>', 'Into' },
    ['<f10>'] = { '<cmd>lua require"dap".step_over()<cr>', 'Over' },
    ['<s-f11>'] = { '<cmd>lua require"dap".step_out()<cr>', 'Out' },
    ['<f1>'] = { '<cmd>lua require"dap".repl.toggle()<cr>', 'Repl' },
    ['<f3>'] = { '<cmd>lua require"dap".run_last()<cr>', 'Last' },
    ['<f2>'] = { '<cmd>lua require"dapui".toggle()<cr>', 'UI' },
    ['<f4>'] = { '<cmd>lua require"dap".terminate()<cr>', 'Exit' },
}
