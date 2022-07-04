local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
    return
end

local dashboard = require 'alpha.themes.dashboard'

dashboard.section.header.val = {
    [[███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗]],
    [[████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║]],
    [[██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║]],
    [[██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║]],
    [[██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║]],
    [[╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝]],
}

dashboard.section.buttons.val = {
    dashboard.button('f', '  Find file', ':Telescope find_files<cr>'),
    dashboard.button('n', '  New file', ':ene <bar> startinsert<cr>'),
    dashboard.button('p', '  Find project', ':Telescope projects<cr>'),
    dashboard.button('r', '  Recently used files', ':Telescope oldfiles<cr>'),
    dashboard.button('t', '  Find text', ':Telescope live_grep<cr>'),
    dashboard.button('e', '  Open file explorer', ':NvimTreeToggle<cr> :AlphaRedraw<cr>'),
    dashboard.button('c', '  Configuration', ':edit $MYVIMRC<cr>'),
    dashboard.button('q', '  Quit Neovim', ':q!<cr>'),
}

local function footer()
    local version = vim.version()
    local datetime = os.date ' %d-%m-%Y   %H:%M:%S'
    local platform = ' Other'
    if vim.fn.has 'win32' == 1 then
        platform = ' Windows'
    elseif vim.fn.has 'unix' then
        platform = ' Linux'
    elseif vim.fn.has 'macunix' then
        platform = ' MacOS'
    end
    return string.format('%s   v%d.%d.%d  %s', platform, version.major, version.minor, version.patch, datetime)
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = 'Include'
dashboard.section.buttons.opts.hl = 'Keyword'
dashboard.section.footer.opts.hl = 'Type'

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
