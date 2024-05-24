-- Lualine status bar
return {
    'nvim-lualine/lualine.nvim', -- Clone the status bar plugin
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- DevIcons required to show icons on the bar
    config = function()
        require('lualine').setup({ -- Load Lualine
            options = {
                theme = 'material' -- Load Lualine theme
            }
        })
    end,
}
