-- Colorscheme
return {
    'eldritch-theme/eldritch.nvim', -- Clone the colorscheme
    config = function()
        vim.cmd('colorscheme eldritch') -- Load the colorscheme
    end,
}
