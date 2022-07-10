local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end

local servers = {
    'clangd',
    'omnisharp',
    'jdtls',
    'pylsp',
    'pyright',
    'html',
    'cssls',
    'tsserver',
    'eslint',
    'emmet_ls',
    'gopls',
    'dartls',
    'sumneko_lua',
    'vimls',
    'jsonls',
    'lemminx',
    'yamlls',
}

local settings = {
    ensure_installed = servers,
    ui = {
        icons = {
            server_installed = '✓',
            server_pending = '➜',
            server_uninstalled = '✗',
        }
    },
    keymaps = {
        toggle_server_expand = '<cr>',
        install_server = 'i',
        update_server = 'u',
        check_server_version = 'c',
        update_all_servers = 'U',
        check_outdated_servers = 'C',
        uninstall_server = 'X',
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 10,
}

lsp_installer.setup(settings)

local lspconfig = require 'lspconfig'

for _, server in pairs(servers) do
    local opts = {
        on_attach = require 'plugins.lsp.handlers'.on_attach,
        capabilities = require 'plugins.lsp.handlers'.capabilities,
    }

    local has_custom_opts, server_custom_opts = pcall(require, 'plugins.lsp.settings.' .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend('force', server_custom_opts, opts)
    end

    lspconfig[server].setup(opts)
end

local status_ok, schema = pcall(require, 'schemastore')
if not status_ok then
    return
end

lspconfig.jsonls.setup {
    settings = {
        json = {
            schemas = schema.json.schemas(),
            validate = { enable = true },
        }
    }
}
