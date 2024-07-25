--NEOVIM API ALIAS
local cmd= vim.cmd
local exec=vim.api.nvim_exec
local fin = vim.fin
local g = vim.g
local opt = vim.opt
local wo = vim.wo
--local treesitter = require('plugins/nvim-treesitter')

--General
g.mapleader = ' '
opt.swf = false --No swapfile
opt.mouse = "a"
opt.clipboard:append('unnamedplus')
opt.hlsearch=true
vim.scriptencoding = "utf-8"
opt.encoding= "utf-8"
opt.fileencoding= "utf-8"
--UI
--testttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt
opt.number=true
opt.title = true
opt.relativenumber=true
vim.o.background = "dark"
opt.inccommand= "split"
opt.backspace= {"start", "eol", "indent"}
opt.path:append("**")
opt.splitbelow=true
opt.formatoptions:append({"r"})
opt.expandtab = false --If true, then use spaces instead of tabs
opt.tabstop = 4 --TAB SPACE
opt.syntax = "on"
opt.numberwidth = 1
opt.autoindent = true
opt.smartindent = true
opt.breakindent=true
opt.scrolloff=10
opt.shiftwidth = 2
opt.rnu = true
opt.numberwidth = 1
opt.wrap = true
opt.backup = false
opt.incsearch = true
opt.ignorecase = true

opt.encoding = "utf-8"
opt.showmatch = true
opt.cursorline = true
opt.termguicolors = true
opt.colorcolumn = "120"
opt.matchpairs = "(:),{:},[:]"
opt.eb = true
opt.sw = 2

--Programming
--wo.foldmethod="expr"
--wo.foldexpr='lua.vim.treesitter.treesitter#foldexpr()' --set foldexpr to treesitter
--wo.foldexpr='nvim_treesitter#foldexpr()' --set foldexpr to treesitter
--cmd('set foldexpr=nvim_treesitter#foldexpr()')
