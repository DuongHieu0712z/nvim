local M = {}

M.listchars = {
    eol      = '↩', -- end of line
    tab      = '▸·', -- tab
    space    = '·', -- space
    trail    = '·', -- trailing space
    extends  = '⯈', -- in last column, when wrap line is off and line continues
    precedes = '⯇', -- in first column, when wrap line is off and character visible in first column
    conceal  = ' ', -- show in place of concealed text, when 'conceallevel' is set to 1
    nbsp     = '⌴', -- non-breakable space
}

M.diagnostics = {
    error       = '',
    warning     = '',
    information = '',
    question    = '',
    hint        = 'ﯧ',
    debug       = '',
    trace       = '✎',
    todo        = '',
    hack        = '',
    performance = '',
    note        = '',
}

M.folders = {
    default      = '',
    open         = '',
    empty        = '',
    empty_open   = '',
    symlink      = '',
    symlink_open = '',
    arrow_open   = '',
    arrow_closed = '',
}

M.git = {
    unstaged  = '',
    staged    = 'S',
    unmerged  = '',
    renamed   = '',
    untracked = 'U',
    deleted   = '',
    ignored   = '◌',
}

M.indent_markers = {
    none   = '  ',
    edge   = '│ ',
    item   = '├ ',
    corner = '└ ',
}

M.kind_icons = {
    Array         = '',
    Boolean       = 'ﱭ',
    Calendar      = '',
    Class         = '',
    Color         = '',
    Constant      = '',
    Constructor   = '',
    Enum          = '練',
    EnumMember    = '',
    Event         = '',
    Field         = '',
    File          = '',
    Folder        = '',
    Function      = '',
    Interface     = '',
    Key           = '',
    Keyword       = '',
    Method        = 'm',
    Module        = '全',
    Namespace     = '',
    Null          = 'ﳠ',
    Number        = '',
    Object        = '',
    Operator      = '',
    Package       = '',
    Property      = '',
    Reference     = '',
    Snippet       = '',
    String        = '',
    Struct        = 'פּ',
    Table         = '',
    Tag           = '',
    Text          = '',
    TypeParameter = '',
    Unit          = '',
    Value         = '',
    Variable      = '',
    Watch         = '',
}

M.telescope = {
    prompt    = ' ',
    selection = ' ',
    entry     = '  ',
    multi     = '珞',
}

M.whichkey = {
    breadcrumb = '»',
    separator  = '➜',
    group      = '+',
}

M.others = {
    default   = '',
    symlink   = '',
    filter    = '',
    showbreak = '↪↪',
}

return M
