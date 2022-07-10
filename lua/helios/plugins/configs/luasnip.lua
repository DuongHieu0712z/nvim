local status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then
    return
end

luasnip.config.set_config {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
}

luasnip.snippets = {
    all = {},
    html = {},
}

-- Enable html snippets in javascript/typescript/react
luasnip.snippets.javascript = luasnip.snippets.html
luasnip.snippets.typescript = luasnip.snippets.html
luasnip.snippets.javascriptreact = luasnip.snippets.html
luasnip.snippets.typescriptreact = luasnip.snippets.html

require 'luasnip.loaders.from_lua'.lazy_load()
require 'luasnip.loaders.from_vscode'.lazy_load()
require 'luasnip.loaders.from_snipmate'.lazy_load()
