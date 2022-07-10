local status_ok, project = pcall(require, 'project_nvim')
if not status_ok then
    return
end

project.setup {
    active = true,
    on_config_done = nil,

    manual_mode = false,
    detection_methods = { 'lsp', 'pattern' },
    patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json' },
    ignore_lsp = {},
    exclude_dirs = {},

    show_hidden = false,
    silent_chdir = true,

    datapath = vim.fn.stdpath('data'),
}
