return {
    -- Syntax and Filetype Stuff
    { 'glench/vim-jinja2-syntax' },
    { 'lervag/vimtex'            },
    {
        'sheerun/vim-polyglot',
        priority=900,
        init = function()
            vim.g.polyglot_disabled = {'ftdetect'}
        end
    },

    -- LateX support:
    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method   = 'zathura'
            vim.g.tex_flavor           = 'latex'
            vim.g.vimtex_quickfix_mode = 0
            vim.g.tex_conceal          = 'abdmg'
        end
    },

    -- AST parsing driven syntax:
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local configs = require('nvim-treesitter.configs')
            configs.setup({
                ensure_installed = {
                    'bash',
                    'c',
                    'diff',
                    'helm',
                    'html',
                    'http',
                    'javascript',
                    'json',
                    'latex',
                    'lua',
                    'markdown',
                    'markdown_inline',
                    'python',
                    'query',
                    'sql',
                    'vim',
                    'vimdoc',
                    'yaml',
                },
                sync_install = false,
                highlight = { enable = true },
                indent    = { enable = true },
            })
        end
    },
    { 'nvim-treesitter/playground' },
    { 'nvim-treesitter/nvim-treesitter-context' },
}

