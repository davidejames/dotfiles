return {
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        depenencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
        config = function()
            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                sources = cmp.config.sources({
                    { name = 'nvim.lsp'},
                    { name = 'luasnip' },
                },{
                    { name = 'buffer' },
                }),
                mapping = cmp.mapping.preset.insert({
                    ['<C-u>']     = cmp.mapping.scroll_docs(-4),
                    ['<C-d>']     = cmp.mapping.scroll_docs(4),
                    ['<C-p>']     = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>']     = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>']     = cmp.mapping.confirm({select=true}),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
            })

            vim.diagnostic.config({
                float = {
                    focusable = false,
                    style     = 'minimal',
                    border    = 'rounded',
                    source    = true,
                    header    = '',
                    prefix    = '',
                },
            })
        end
    },
}



