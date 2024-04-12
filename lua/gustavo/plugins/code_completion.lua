-- Nvim CMP
return {
    {
        'hrsh7th/cmp-nvim-lsp' -- Clone sources for the completion engine
    },
    {
        'L3MON4D3/LuaSnip', -- Clone the snippet engine
        dependencies = {
            'saadparwaiz1/cmp_luasnip', -- Enable code completion
            'rafamadriz/friendly-snippets', -- Useful snippets
        },
    },
    {
        'hrsh7th/nvim-cmp', -- Clone the completion engine
        config = function()
            -- Local variables
            local cmp = require('cmp') -- Enable code completion

            -- Code completion settings
            cmp.setup({
                -- Snippet engine settings
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- Load snippet engine
                    end,
                },

                -- Code completion UI
                window = {
                    completion = cmp.config.window.bordered(), -- Enable UI for code completion
                    documentation = cmp.config.window.bordered(), -- Enable UI for code documentation
                },

                -- Keyboard shortcuts
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(), -- Open up the completion UI
                    ['<C-e>'] = cmp.mapping.abort(), -- Cancel the completion
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm the completion
                }),

                -- Sources
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' }, -- Completion from LSP
                    { name = 'luasnip' }, -- Completion from snippet engine
                    { name = 'buffer' }, -- Completion from current file
                }),
            })
        end,
    },
}
