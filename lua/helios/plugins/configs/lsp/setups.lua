local M = {}

-- See more servers at https://github.com/williamboman/nvim-lsp-installer#available-lsps
M.servers = {
    -- 'ccls',
    'clangd',
    -- 'csharp_ls',
    'omnisharp',
    -- 'java_language_server',
    'jdtls',
    'pylsp',
    'pyright',

    'html',
    'cssls',
    'cssmodules_ls',
    'tsserver',
    'eslint',
    'emmet_ls',

    -- 'angularls',
    -- 'vuels',

    'gopls',
    'sumneko_lua',
    'vimls',

    'marksman',
    'jsonls',
    -- 'lemminx',
    -- 'yamlls',
    -- 'taplo',

    'sqlls',
    'sqls',
    'cmake',
    'dockerls',
    'diagnosticls',
}

M.setup = function()
    local diag_icons = require 'helios.theme.icons'.diagnostics
    local signs = {
        { name = 'DiagnosticSignError', text = diag_icons.error },
        { name = 'DiagnosticSignWarn', text = diag_icons.warning },
        { name = 'DiagnosticSignInfo', text = diag_icons.information },
        { name = 'DiagnosticSignHint', text = diag_icons.hint },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
    end

    local config = {
        virtual_text = true,
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'rounded',
    })

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded',
    })

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    })
end

local function lsp_highlight_document(client)
    local ok, illuminate = pcall(require, 'illuminate')
    if ok then
        illuminate.on_attach(client)
    end
end

local function lsp_symbol_outline(client, bufnr)
    local ok, aerial = pcall(require, 'aerial')
    if ok then
        aerial.on_attach(client, bufnr)
    end
end

local function  lsp_code_context(client, bufnr)
    local ok, navic = pcall(require, 'nvim-navic')
    if ok then
        navic.attach(client, bufnr)
    end
end

M.on_attach = function(client, bufnr)
    local vim_version = vim.version()
    if vim_version.minor > 7 then
        -- Nightly version
        client.resolved_capabilities.documentFormattingProvider = false
        client.resolved_capabilities.documentRangeFormattingProvider = false
    else
        -- Stable version
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end

    local lsp_mappings = require 'helios.core.mappings'.lsp_mappings
    require 'helios.core.utils'.load_mappings(lsp_mappings, { buffer = bufnr })

    lsp_highlight_document(client)
    lsp_symbol_outline(client, bufnr)
    lsp_code_context(client, bufnr)
end

local function make_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem = {
        documentationFormat = { 'markdown', 'plaintext' },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
            properties = {
                'documentation',
                'detail',
                'additionalTextEdits',
            },
        },
    }

    local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if ok then
        capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
        capabilities.textDocument.semanticHighlighting = true
        capabilities.offsetEncoding = 'utf-8'
    end

    return capabilities
end

M.capabilities = make_capabilities()

M.handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded', }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded', }),
    ['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }),
}

return M
