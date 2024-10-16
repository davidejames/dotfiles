
-- Basic Keymaps

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- strip end of line whitespace on save
vim.api.nvim_create_autocmd({'BufWritePre'},{
    pattern = { '*' },
    command = [[%s/\s\+$//e]],
})

-- remove search highlights after hitting escape:
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic Keymaps:
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist,
    {desc = 'Open Diagnostic [Q]uickfix list' }
)

-- Highlight while yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank',
        { clear = true }
    ),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.keymap.set('n', '-', vim.cmd.Ex)

-- better file scroll/jump
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n',     'nzzzv'  )
vim.keymap.set('n', 'N',     'Nzzzv'  )

-- yanking:
vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]])
vim.keymap.set({'n',    }, '<leader>Y', [["+Y]])
vim.keymap.set({'n', 'v'}, '<leader>d', [["_d]])

-- misc qol:
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', 'Q',     'nop>' )
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', {silent=true})

-- misc navigation:
vim.keymap.set('n', '<C-k>',     '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>',     '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')


-- learning:
vim.keymap.set('n', '<leader>vwm', function()
    require('vim-with-me').StartVimWithMe()
end)
vim.keymap.set('n', '<leader>svwm', function()
    require('vim-with-me').StopVimWithMe()
end)

-- fun/stress relief:
vim.keymap.set('n', '<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>')
