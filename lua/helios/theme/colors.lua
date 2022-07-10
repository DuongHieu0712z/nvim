local cmd = vim.cmd

-- Treesitter
cmd [[hi TSAnnotation         guifg=#8ebd6b]]
cmd [[hi TSAttribute          guifg=#88ffff]]
cmd [[hi TSBoolean            guifg=#fe8679]]
cmd [[hi TSCharacter          guifg=#ffff44]]
cmd [[hi TSConstant           guifg=#e55561]]
cmd [[hi TSField              guifg=#ecc812]]
cmd [[hi TSFloat              guifg=#48b0bd]]
cmd [[hi TSNumber             guifg=#48b0bd]]
cmd [[hi TSOperator           guifg=#ffadd2]]
cmd [[hi TSParameter          guifg=#ecac38]]
cmd [[hi TSParameterReference guifg=#ecac38]]
cmd [[hi TSProperty           guifg=#50c0cc]]
cmd [[hi TSString             guifg=#ffff44]]
cmd [[hi TSVariable           guifg=#ec9706]]
cmd [[hi TSTag                guifg=#fe8812]]
cmd [[hi TSTagDelimiter       guifg=#fe8812]]

-- Indent blankline
cmd [[hi IndentBlanklineIndent1 guifg=#ff8888 guibg=#1f1f1f]]
cmd [[hi IndentBlanklineIndent2 guifg=#88ffff guibg=#1a1a1a]]
cmd [[hi IndentBlanklineIndent3 guifg=#88ff88 guibg=#1f1f1f]]
cmd [[hi IndentBlanklineIndent4 guifg=#ff88ff guibg=#1a1a1a]]
cmd [[hi IndentBlanklineIndent5 guifg=#8888ff guibg=#1f1f1f]]
cmd [[hi IndentBlanklineIndent6 guifg=#ffff88 guibg=#1a1a1a]]

cmd [[hi IndentBlanklineContextStart gui=underline guisp=#9932bc]]
cmd [[hi IndentBlanklineContextChar  guifg=#9932bc]]

-- Treesitter rainbow
cmd [[hi rainbowcol1 guifg=#dc143c]]
cmd [[hi rainbowcol2 guifg=#ff8c00]]
cmd [[hi rainbowcol3 guifg=#ffd700]]
cmd [[hi rainbowcol4 guifg=#32cd32]]
cmd [[hi rainbowcol5 guifg=#4169e1]]
cmd [[hi rainbowcol6 guifg=#a28be7]]
cmd [[hi rainbowcol7 guifg=#ba55d3]]
