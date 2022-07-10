local status_ok, theme = pcall(require, 'onedark')
if not status_ok then
    return
end

theme.setup {
    style = 'darker',
    transparent = false,
    ending_tildes = true,
    cmp_itemkind_reverse = true,
}
theme.load()
