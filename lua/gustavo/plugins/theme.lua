-- Colorscheme
return {
    'marko-cerovac/material.nvim', -- Clone the colorscheme
    config = function()
        require('material').setup({
            lualine_style = 'default' -- Enables Lualine Theme
        })
        vim.g.material_style = 'deep ocean'
        vim.cmd('colorscheme material') -- Load the colorscheme
    end,
}
