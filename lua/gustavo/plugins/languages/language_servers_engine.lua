-- Lsp config
return {
    'neovim/nvim-lspconfig', -- Clone the language server protocol communication engine
    event = { 'BufReadPre', 'BufNewFile' }, -- Only enable on current file
    dependencies = {
        'hrsh7th/cmp-nvim-lsp', -- Communication between LSP's and VIM
        { 'antosha417/nvim-lsp-file-operations', config = true }, -- Inteligent operations for when files are renamed
        { 'folke/neodev.nvim', opts = {} }, -- Better lua integration for when tinkering with vim config
    },
    -- Lsp settings
    config = function()
        -- Local variables
        local lspconfig = require('lspconfig') -- Load lsp config
        local mason_lspconfig = require('mason-lspconfig') -- Load integration between lsp and mason
        local cmp_nvim_lsp = require('cmp_nvim_lsp') -- Load integration between lsp and code completion engine
        local keymap = vim.keymap -- Load vim.keymap as keymap

        -- Auto commands
        vim.api.nvim_create_autocmd('LspAttach', { -- Whenever an LSP attach to a file, enable these keyboard shortcuts
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Local variables
                local opts = { buffer = ev.buf, silent = true } -- Load the keyboard shortcuts on the attached file

                -- Keyboard shortcuts
                opts.desc = 'Show LSP references'
                keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts) -- Show references

                opts.desc = 'Show LSP definitions'
                keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts) -- Go to definition

                opts.desc = 'See available code actions'
                keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- Execute code action

                opts.desc = 'Smart rename'
                keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- Smart rename

                opts.desc = 'Show documentation for what is under cursor'
                keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Show documentation
            end,
        })

        -- Local variables
        local capabilities = cmp_nvim_lsp.default_capabilities() -- Enable code completion using LSP
        local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' } -- Show these icons whenever the LSP encounter any error in the code
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        -- Programming language settings
        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            -- Lua specific settings
            ['lua_ls'] = function()
                lspconfig['lua_ls'].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = { -- Recognizes vim options as defaults variables
                            diagnostics = {
                                globals = { 'vim' },
                            },
                            completion = {
                                callSnippet = 'Replace',
                            },
                        },
                    },
                })
            end,
        })
    end,
}
