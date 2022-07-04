local status_ok, colorizer = pcall(require, 'colorizer')
if not status_ok then
    return
end

colorizer.setup(
    { '*' }, {
    RGB      = true,
    RRGGBB   = true,
    RRGGBBAA = true,
    names    = true,
    rgb_fn   = true,
    hsl_fn   = true,
    css      = true,
    css_fn   = true,
    mode     = 'background',
})
