return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        lazy   = true,
        config = true,
    },
    {
        'williamsboman/mason.nvim',
        lazy   = false,
        config = true,
    },
    {
        'neovim/nvim-lspconfig',
        cmd   = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp'                                  },
            { 'williamboman/mason.nvim', version = "^1.0.0"           },
            { 'williamboman/mason-lspconfig.nvim', version = "^1.0.0" },
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            local lsp_attach = function(client, bufnr)
                local opts = {buffer=bufnr}

                vim.keymap.set('n', 'K',    '<cmd>lua vim.lsp.buf.hover()<cr>'          ,opts)
                vim.keymap.set('n', 'gd',   '<cmd>lua vim.lsp.buf.definition()<cr>'     ,opts)
                vim.keymap.set('n', 'gD',   '<cmd>lua vim.lsp.buf.declaration()<cr>'    ,opts)
                vim.keymap.set('n', 'gi',   '<cmd>lua vim.lsp.buf.implementation()<cr>' ,opts)
                vim.keymap.set('n', 'go',   '<cmd>lua vim.lsp.buf.type_definition()<cr>',opts)
                vim.keymap.set('n', 'gr',   '<cmd>lua vim.lsp.buf.references()<cr>'     ,opts)
                vim.keymap.set('n', 'gs',   '<cmd>lua vim.lsp.buf.signature_help()<cr>' ,opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>'         ,opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>'    ,opts)

                vim.keymap.set({'n', 'x'}, '<F3>',
                    '<cmd>lua vim.lsp.buf.format({async=true})<cr>', opts
                )
            end

            lsp_zero.extend_lspconfig({
                sign_text = true,
                lsp_attach = lsp_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities()
            })

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    function(server_name)
                        require('lsp_config')[server_name].setup({})
                    end,
                }
            })
        end
    }
}
