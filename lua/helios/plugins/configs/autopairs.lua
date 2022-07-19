local status_ok, npairs = pcall(require, 'nvim-autopairs')
if not status_ok then
    return
end

npairs.setup {
    check_ts = true,
    ts_config = {
        lua = { 'string', 'source' },
        javascript = { 'string', 'template_string' },
        -- java = false,
    },
    disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        offset = 0,
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'PmenuSel',
        highlight_grey = 'LineNr',
    },
}


local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    return
end

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done { map_char = { tex = '' } }
)


-- See more infomation about rules API at https://github.com/windwp/nvim-autopairs/wiki/Rules-API
-- See more custom rules at https://github.com/windwp/nvim-autopairs/wiki/Custom-rules
local Rule = require 'nvim-autopairs.rule'
local cond = require 'nvim-autopairs.conds'

local get_closing_for_line = function(line)
    local i = -1
    local clo = ''

    while true do
        i, _ = string.find(line, '[%(%)%{%}%[%]]', i + 1)
        if i == nil then break end
        local ch = string.sub(line, i, i)
        local st = string.sub(clo, 1, 1)

        if ch == '{' then
            clo = '}' .. clo
        elseif ch == '}' then
            if st ~= '}' then return '' end
            clo = string.sub(clo, 2)
        elseif ch == '(' then
            clo = ')' .. clo
        elseif ch == ')' then
            if st ~= ')' then return '' end
            clo = string.sub(clo, 2)
        elseif ch == '[' then
            clo = ']' .. clo
        elseif ch == ']' then
            if st ~= ']' then return '' end
            clo = string.sub(clo, 2)
        end
    end

    return clo
end

npairs.add_rules {
    -- Add spaces between parentheses
    Rule(' ', ' ')
        :with_pair(function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ '()', '[]', '{}' }, pair)
        end)
        :with_move(cond.none())
        :with_cr(cond.none())
        :with_del(function(opts)
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local ctx = opts.line:sub(col - 1, col + 2)
            return vim.tbl_contains({ '(  )', '{  }', '[  ]' }, ctx)
        end),
    Rule('( ', ' )')
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match('.%)') ~= nil
        end)
        :use_key(')'),
    Rule('{ ', ' }')
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match('.%}') ~= nil
        end)
        :use_key('}'),
    Rule('[ ', ' ]')
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match('.%]') ~= nil
        end)
        :use_key(']'),
    Rule('', ' )')
        :with_pair(cond.none())
        :with_move(function(opts) return opts.char == ')' end)
        :with_cr(cond.none())
        :with_del(cond.none())
        :use_key(')'),
    Rule('', ' }')
        :with_pair(cond.none())
        :with_move(function(opts) return opts.char == '}' end)
        :with_cr(cond.none())
        :with_del(cond.none())
        :use_key('}'),
    Rule('', ' ]')
        :with_pair(cond.none())
        :with_move(function(opts) return opts.char == ']' end)
        :with_cr(cond.none())
        :with_del(cond.none())
        :use_key(']'),

    -- Expand pair only on enter key
    Rule('{', '}')
        :end_wise(function() return true end),
    Rule('(', ')')
        :end_wise(function() return true end),
    Rule('[', ']')
        :end_wise(function() return true end),

    -- Arrow key on javascript
    Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' })
        :use_regex(true)
        :set_end_pair_length(2),

    -- Auto addspace on =
    Rule('=', '')
        :with_pair(cond.not_inside_quote())
        :with_pair(function(opts)
            local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
            if last_char:match('[%w%=%s]') then
                return true
            end
            return false
        end)
        :replace_endpair(function(opts)
            local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
            local next_char = opts.line:sub(opts.col, opts.col)
            next_char = next_char == ' ' and '' or ' '
            if prev_2char:match('%w$') then
                return '<bs> =' .. next_char
            end
            if prev_2char:match('%=$') then
                return next_char
            end
            if prev_2char:match('=') then
                return '<bs><bs>=' .. next_char
            end
            return ''
        end)
        :set_end_pair_length(0)
        :with_move(cond.none())
        :with_del(cond.none()),

    -- Expand multiple pairs on enter key
    Rule('[%(%{%[]', '')
        :use_regex(true)
        :replace_endpair(function(opts)
            return get_closing_for_line(opts.line)
        end)
        :end_wise()
}
