require('helpers/globals')

cmd([[filetype plugin indent on]])

opt.hlsearch = true
opt.number = true
opt.mouse = ""

-- Tab
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.expandtab = true
opt.smartindent = true

-- Folding
opt.foldmethod = 'syntax'
vim.g['javaScript_fold'] = 1
vim.g['python_folding'] = 1

-- Clipboard
opt.clipboard = 'unnamedplus'
opt.fixeol = true

-- Search
opt.ignorecase = true
opt.joinspaces = false
opt.smartcase = true
opt.showmatch = true

-- Window
opt.splitbelow = true
opt.splitright = true

