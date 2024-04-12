-- Nvim cmp
return {
    'hrsh7th/nvim-cmp', -- Clone the code completion engine
    event = 'InsertEnter', -- Enable only in insert mode
    dependencies = {
        'hrsh7th/cmp-buffer', -- Source for text in current file
        'hrsh7th/cmp-path', -- Source for system paths
        { 'L3MON4D3/LuaSnip', version = 'v2.*' }, -- Clone the snippets engine
        'saadparwaiz1/cmp_luasnip', -- Snippets for code completion
        'rafamadriz/friendly-snippets', -- Useful snippets
    },
    config = function()
        -- Local variables
        local cmp = require('cmp') -- Load code completion engine
        local luasnip = require('luasnip') -- Load snippet engine

        -- Vs-code style snippets
        require('luasnip.loaders.from_vscode').lazy_load() -- Enable Vs-code style snippets 

        -- Javascript React
        require('luasnip').filetype_extend('typescript', { 'javascript' }) -- Enable React snippets

        -- Code completion engine settings
        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,preview,noselect', -- Enable code completion
            },

            -- Snippet engine settings
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- Enable interaction between completion engine and snippet engine
                end,
            },

            -- Keyboard shortcuts
            mapping = cmp.mapping.preset.insert({
                ['<C-j>'] = cmp.mapping.select_next_item(), -- Next suggestion
                ['<C-k>'] = cmp.mapping.select_prev_item(), -- Previous suggestion
                ['<C-Space>'] = cmp.mapping.complete(), -- Show completion suggestions
                ['<C-e>'] = cmp.mapping.abort(), -- Close completion window
                ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Confirm completion
            }),

            -- Sources for code completion
            sources = cmp.config.sources({
                { name = 'luasnip' }, -- Snippet engine
                { name = 'buffer' }, -- Text in the current file
                { name = 'path' }, -- System paths
            }),
        })
    end,
}
