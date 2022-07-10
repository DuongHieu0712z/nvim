local M = {}

local diag_icons = require 'helios.theme.icons'.diagnostics

M.setup = function()
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
    local status_ok, illuminate = pcall(require, 'illuminate')
    if not status_ok then
        return
    end
    illuminate.on_attach(client)
end

M.on_attach = function(client, bufnr)
    local vim_version = vim.version()
    if vim_version.minor > 7 then
        -- nightly
        client.resolved_capabilities.documentFormattingProvider = false
        client.resolved_capabilities.documentRangeFormattingProvider = false
    else
        -- stable
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end

    local lsp_mappings = require 'helios.core.mappings'.lsp_mappings
    require 'helios.core.utils'.load_mappings(lsp_mappings, {
        buffer = bufnr,
        silent = true,
        noremap = true,
        nowait = true,
    })

    lsp_highlight_document(client)

    local status_ok, aerial = pcall(require, 'aerial')
    if status_ok then
        aerial.on_attach(client, bufnr)
    end
end

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

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
    return
end

local cmp_capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
cmp_capabilities.textDocument.semanticHighlighting = true
cmp_capabilities.offsetEncoding = 'utf-8'

M.capabilities = cmp_capabilities

return M
