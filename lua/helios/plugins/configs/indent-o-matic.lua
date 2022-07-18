local status_ok, indent = pcall(require, 'indent-o-matic')
if not status_ok then
    return
end

local filetypes = {
    'html',
    'css',
    'scss',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'markdown',
    'json',
    'xml',
    'yaml',
    'toml',
}

local options = {
    max_lines = 2048,
    standard_widths = { 2, 4 },
    skip_multiline = false,
    filetype_ = {
        standard_widths = { 2, 4 },
    },
}

for _, v in ipairs(filetypes) do
    options['filetype_' .. v] = {
        standard_widths = { 2 },
    }
end

indent.setup(options)
