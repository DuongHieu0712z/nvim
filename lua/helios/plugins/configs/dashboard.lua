local status_ok, dashboard = pcall(require, 'dashboard')
if not status_ok then
    return
end

dashboard.preview_command = 'cat | lolcat -F 0.3'
dashboard.preview_file_path = vim.fn.stdpath 'config' .. '/static/neovim.cat'
dashboard.preview_file_height = 12
dashboard.preview_file_width = 80
