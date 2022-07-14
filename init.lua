if vim.fn.has('nvim-0.7') == 0 then
    error 'Require Neovim v0.7+'
end

do
    local ok, impatient = pcall(require, 'impatient')
    if ok then
        impatient.enable_profile()
    end
end

local ok, helios = pcall(require, 'helios')
if not ok then
    error(('Error loading core...\n\n%s'):format(helios))
end
