-- no fancy cursor:
vim.opt.guicursor = ''

-- numbering:
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs:
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true

-- infer some indenting:
vim.opt.smartindent = true

-- wrap!
vim.opt.wrap = true

-- more natural split behavior:
vim.opt.splitright = true
vim.opt.splitbelow = true

-- metadata:
vim.opt.swapfile = false
vim.opt.backup   = false
vim.opt.undodir  = os.getenv('HOME') .. '/.vim/undodir'

-- searching:
vim.opt.hlsearch   = false
vim.opt.incsearch  = true
vim.opt.ignorecase = true  -- ignore case in search
vim.opt.smartcase  = true  --  .. unless a capital letter is typed

-- allow 24bit color
vim.opt.termguicolors = true

-- scroll offset
vim.opt.scrolloff = 10

-- column settings:
vim.opt.colorcolumn = '80'
vim.opt.signcolumn  = 'yes'

-- file name
vim.opt.isfname:append('@-@')

-- don't wait long for sequences
vim.opt.updatetime = 50

-- Clipboard syncing (deferred due to impact on startup time)
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

vim.g.netrw_banner = false

