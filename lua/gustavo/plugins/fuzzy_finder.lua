-- Telescope fuzzy finder
return {
    'nvim-telescope/telescope.nvim', -- Clone the fuzzy finder
    tag = '0.1.6', -- Telescope version
    dependencies = { 
        'nvim-lua/plenary.nvim', -- Plenary necessary to use Telescope
        'nvim-tree/nvim-web-devicons', -- DevIcons show icons when searching file in Telescope
    },
    config = function()
        -- Local variables
        local builtin = require('telescope.builtin') -- Load Telescope settings

        -- Keyboard shortcuts
        vim.keymap.set('n', '<C-f>', builtin.find_files, {}) -- Find files by name
        vim.keymap.set('n', '<leader>f', builtin.live_grep, {}) -- Type something to search through the files
    end,
}
