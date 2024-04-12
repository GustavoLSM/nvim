-- Nvim surround
return {
    'kylechui/nvim-surround', -- Clone the surround plugin
    version = '*', -- Surround version
    event = 'VeryLazy', -- Load after other plugins
    config = function()
        require('nvim-surround').setup({}) -- Load surround
    end,
}
