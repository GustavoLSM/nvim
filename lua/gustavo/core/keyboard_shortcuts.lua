-- Local variables
local keymap = vim.keymap -- Set vim.keymap by just typing keymap

-- Leader key
vim.g.mapleader = ' ' -- Set space as the leader key

-- NetRW
keymap.set('n', '<leader>e', ':Ex<CR>') -- Opens NetRW

-- Search highlights
keymap.set('n', '<leader>nh', ':nohl<CR>') -- Clear search highlights

-- Window management
keymap.set('n', '<leader>sv', '<C-w>v') -- Split window vertically
keymap.set('n', '<leader>sh', '<C-w>s') -- Split window horizontally
keymap.set('n', '<leader>sx', '<cmd>close<CR>') -- Close current window

keymap.set('n', '<C-h>', '<C-w>h') -- Navigate to the window on the left
keymap.set('n', '<C-j>', '<C-w>j') -- Navigate to the window below
keymap.set('n', '<C-k>', '<C-w>k') -- Navigate to the window above
keymap.set('n', '<C-l>', '<C-w>l') -- Navigate to the window on the right
