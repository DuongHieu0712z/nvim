local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return
end

local setups = require 'helios.plugins.configs.lsp.setups'

for _, server in pairs(setups.servers) do
    local opts = {
        on_attach = setups.on_attach,
        capabilities = setups.capabilities,
        handlers = setups.handlers,
    }

    local has_custom_opts, server_custom_opts = pcall(require, 'helios.plugins.lsp.providers.' .. server)
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
