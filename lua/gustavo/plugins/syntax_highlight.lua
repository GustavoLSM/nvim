-- Treesitter syntax highlighter
return {
    'nvim-treesitter/nvim-treesitter', -- Clone syntax highlighting plugin
    build = ':TSUpdate', -- Treesitter version
    config = function()
        -- Local variables
        local config = require('nvim-treesitter.configs') -- Load Treesitter settings

        -- Syntax highlighting settings
        config.setup({
            ensure_installed = { 'php', 'javascript', 'lua', 'css', 'html' }, -- Automatically configure highlight on these languages
            highlight = { enable = true }, -- Enable highlighting
            indent = { enable = true }, -- Enable autoindent on configured languages
        })
    end,
}
