local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "
g.netrw_banner = 0
g.netrw_browse_split = 0
g.netrw_liststyle = 3
g.netrw_winsize = 25

-- General
opt.termguicolors = true
opt.relativenumber = true
opt.number = true
opt.mouse = ""
opt.wrap = true
opt.breakindent = true
opt.undofile = true
opt.signcolumn = "yes"
opt.updatetime = 200
opt.inccommand = "split"
opt.cursorline = true
opt.scrolloff = 10
opt.guicursor = "n-v-i-c:block-Cursor"

-- Tab
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.expandtab = true
opt.smartindent = true

-- White spaces
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Folding
opt.foldmethod = "syntax"
vim.g["javaScript_fold"] = 1
vim.g["python_folding"] = 1

-- Clipboard
opt.clipboard = "unnamedplus"
opt.fixeol = true

-- Search
opt.ignorecase = true
opt.joinspaces = false
opt.smartcase = true
opt.showmatch = true
opt.hlsearch = true

-- Window
opt.splitbelow = true
opt.splitright = true
