local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
    return
end

-- See more information at https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover

null_ls.setup({
    debug = false,
    sources = {
        code_actions.eslint_d,  -- js, jsx, ts, tsx
        -- code_actions.gitsigns,  -- git
        -- code_actions.refactoring,  -- go, js, lua, py, ts

        -- completion.luasnip,  -- snippet
        -- completion.tags,  -- tags

        -- diagnostics.codespell,  -- find missspelling
        -- diagnostics.cppcheck,  -- c/c++
        -- diagnostics.cspell,  -- spell checker
        -- diagnostics.eslint_d,  -- js, jsx, ts, tsx
        -- diagnostics.flake8,  -- py
        -- diagnostics.gitlint,  -- git
        -- diagnostics.golangci_lint,  -- go
        -- diagnostics.jsonlint,  -- json
        -- diagnostics.luacheck,  -- lua
        -- diagnostics.markdownlint,  -- markdown
        -- diagnostics.misspell,  -- misspell
        -- diagnostics.pylint,  -- py
        -- diagnostics.revive,  -- go
        -- diagnostics.stylelint,  -- css, scss, less, sass
        -- diagnostics.tidy,  -- html, xml
        -- diagnostics.trail_space,  -- trailing space
        -- diagnostics.vint,  -- vim
        -- diagnostics.yamllint,  -- yaml

        formatting.astyle,  -- c/c++, c#, java
        formatting.black, -- python
        -- formatting.clang_format,  -- c/c++, c#, java
        -- formatting.codespell,  -- fix missspelling
        formatting.dart_format,  -- dart
        -- formatting.eslint_d,  -- js, jsx, ts, tsx
        formatting.gofmt,  -- go
        -- formatting.goimports,  -- go imports
        formatting.json_tool,  -- json
        -- formatting.lua_format, -- lua
        -- formatting.markdownlint,  -- markdown
        formatting.prettier,  -- prettier
        -- formatting.stylelint,  -- css, scss, less, sass
        -- formatting.stylua,  -- lua
        -- formatting.tidy,  -- html, xml
        -- formatting.trim_whitespace,  -- trim whitespace

        hover.dictionary, -- md, txt
    },
})
