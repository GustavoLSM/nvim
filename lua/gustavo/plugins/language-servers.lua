-- Mason
return {
    {
        'williamboman/mason.nvim', -- Plugin for downloading and setting up LSP
        lazy = false, -- Always load
        config = function()
            require('mason').setup() -- Load Mason
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim', -- Plugin for interacting with the LSP's installed
        lazy = false, -- Always load
        config = function()
            -- Language Server Protocol (LSP)
            require('mason-lspconfig').setup({
                ensure_installed = { 'intelephense', 'tsserver', 'lua_ls' }, -- Always install these languages
                auto_install = true, -- Auto install on vim startup
            })
        end,
    },
    {
        -- Interaction with LSP
        'neovim/nvim-lspconfig', -- Engine for interacting with LSP's
        lazy = false, -- Always load
        config = function()
            -- Local variables
            local capabilities = require('cmp_nvim_lsp').default_capabilities() -- Enable code completion based on the LSP's installed
            local lspconfig = require('lspconfig') -- Enable communication between LSP and the completion engine

            -- Language settings
            lspconfig.intelephense.setup({ capabilities = capabilities }) -- Enable PHP code completion
            lspconfig.tsserver.setup({ capabilities = capabilities }) -- Enable JavaScript code completion
            lspconfig.lua_ls.setup({ capabilities = capabilities }) -- Enable Lua code completion

            -- Keyboard shortcuts
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- Show documentation
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {}) -- Go to definition
            vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {}) -- Go to reference
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {}) -- LSP rename
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {}) -- Perform code action
        end,
    },
}
