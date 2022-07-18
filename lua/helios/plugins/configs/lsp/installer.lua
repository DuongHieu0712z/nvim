local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end

local servers = require 'helios.plugins.configs.lsp.setups'.servers

lsp_installer.setup {
    ensure_installed = servers,
    automatic_installation = true,
    ui = {
        border = 'rounded',
        icons = {
            server_installed = '✓',
            server_pending = '➜',
            server_uninstalled = '✗',
        },
        keymaps = {
            toggle_server_expand = '<cr>',
            install_server = 'i',
            update_server = 'u',
            check_server_version = 'c',
            update_all_servers = 'U',
            check_outdated_servers = 'C',
            uninstall_server = 'X',
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 10,
}
