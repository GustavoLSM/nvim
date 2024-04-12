-- Mason
return {
    'williamboman/mason.nvim', -- Clone the language servers engine
    dependencies = {
        'williamboman/mason-lspconfig.nvim', -- Clone the engine to talk to the servers
    },
    config = function()
        -- Local variables
        local mason = require('mason') -- Load mason
        local mason_lspconfig = require('mason-lspconfig') -- Load lsp config

        -- Mason settings
        mason.setup({
            ui = {
                icons = { -- Load icons on mason UI
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- Lsp config settings
        mason_lspconfig.setup({
            ensure_installed = { -- Automatically install these languages
                'intelephense',
                'tsserver',
                'lua_ls'
            },
        })
    end,
}
