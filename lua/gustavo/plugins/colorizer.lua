return {
    'norcalli/nvim-colorizer.lua', -- Clone the repository
    config = function()
        require('colorizer').setup({'*'}) -- Load colorizer
    end,
}
