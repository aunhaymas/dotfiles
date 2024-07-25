local map= vim.api.nvim_set_keymap
local default_ops = {noremap = true, silent = true}
local cmd= vim.cmd
--Managment
map("","<leader>w", ":w<CR>",default_ops) --save
map("","<leader>wq", ":x<CR>",default_ops) -- save & exit
map("","<leader>t", ":tabnew<CR>",default_ops) --newtab
map("","<leader>j", ":tabprevious<CR>",default_ops) --newtab
map("","<leader>q", ":q<CR>",default_ops) --delete_tab
map("","<leader>k", ":tabnext<CR>",default_ops) --tab_next
--NeoTree
map("n","<leader>e", ":Neotree toggle<CR>",default_ops)
map("n","<leader><TAB>", ":Neotree focus<CR>",default_ops)
--HopNvim
local hop = require('plugins.hop')
--local directions = require('plugins.hop').hint.HintDirection
map('', 'f', '<cmd>lua require("hop").hint_words()<CR>', { silent = true })

