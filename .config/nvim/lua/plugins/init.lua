
return {
    { 'folke/lazydev.nvim'  }, -- qol for config editing

    -- Color Scheme!!
    { 'https://gitlab.com/shmerl/neogotham.git',
        lazy = false, -- to make sure it's loaded on startup
        priority = 1000, -- to load before other plugins
        config = function()
          vim.cmd.colorscheme("neogotham")
        end
    },


    -- NeoVim UI stuff:
    { 'nvim-lua/popup.nvim' },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl', -- see `:help ibl`
        opts = {
            indent = { char = '┊', tab_char = '|' },
        },
    },
    -- {
    --     'nvim-neo-tree/neo-tree.nvim',
    --     branch = 'v3.x',
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --         'nvim-tree/nvim-web-devicons',
    --         'MunifTanjim/nui.nvim',
    --     }
    -- },

    -- fuzzy finding:
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers,    {})
            vim.keymap.set('n', '<leader>fg', builtin.git_files,  {})
            vim.keymap.set('n', '<leader>ft', builtin.help_tags,  {})
            vim.keymap.set('n', '<leader>fl', function()
                builtin.grep_string({ search = vim.fn.input('Grep > ') })
            end)
        end,
    },

    -- mini - misc functionality
    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            -- Better Navigation Around/Inside textobjects
            --   va)  - [V]isually select [A]round [)]paren
            --   yinq - [Y]ank [I]nside [N]ext [Q]uote
            --   ci'  - [C]hange [I]nside [']quote
            require('mini.ai').setup { n_lines = 500 }

            -- Add/Delete/Replace surrounding (brackets, quotes, etc..)
            --   saiw) - [S]urround [A]dd [I]nner [W]ord [)]paren
            --   sd'   - [S]urround [D]elete [']quotes
            --   sr)'  - [S]urround [R]eplace [)] with [']
            require('mini.surround').setup()
        end
    },

    -- undo tree
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    },

    -- file manager
    {
        'stevearc/oil.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            default_file_explorer = false,
            columns = { 'icon' },
            view_options = { show_hidden = true }
        },
        init = function()
            vim.keymap.set('n', '=', '<CMD>Oil<CR>',
                { desc = 'Open parent directory' }
            )
        end
    },

    -- alignment
    {
        'junegunn/vim-easy-align',
        init = function()
            vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', {desc = 'EasyAlign'})
            vim.keymap.set('n', 'ga', '<Plug>(EasyAlgin)', {desc = 'EasyAlign'})
        end
    },

    -- tpope:
    { 'tpope/vim-sleuth'     },
    { 'tpope/vim-sensible'   },
    { 'tpope/vim-unimpaired' },
    { 'tpope/vim-repeat'     },
    { 'tpope/vim-fugitive'   },

    -- vimwiki!
    {
        'vimwiki/vimwiki',
        init = function()
            -- use markdown instead of `vimwiki` files
            vim.g.vimwiki_list = {{
                path   = [[~/vimwiki/]],
                syntax = 'markdown',
                ext    = 'md',
            }}

            -- ..BUT do not take over all markdown files:
            vim.g.vimwiki_global_ext = 0
        end
    },

    -- Learning:
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            -- using defaults for now
        },
        keys = {
            {
                '<leader>?',
                function()
                    require('which-key').show({ global = false })
                end,
                desc = 'Buffer Local keymaps (which-key)',
            },
        },
    },

    -- best directory diffing I've seen yet:
    { 'will133/vim-dirdiff' },

    -- play:
    { 'eandrju/cellular-automaton.nvim' },
}
