-- Local variables
local opt = vim.opt -- Set vim.opt by just typing opt

-- NetRW
vim.cmd('let g:netrw_liststyle = 3') -- Enables tree visualization

-- Line numbers
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers

-- Indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- Expand tab to spaces
opt.autoindent = true -- Copy indentation from current line when starting a new one
opt.backspace = 'indent,eol,start' -- Allow backspace on vim (sometimes vim does not recognize backspace)

-- Line wrapping
opt.wrap = false -- No line wrapping

-- Search settings
opt.ignorecase = true -- Case insensitive when searching
opt.smartcase = true -- If you include uppercase letters in your search, enables case sensitive search

-- Cursor line
opt.cursorline = true -- Highlight the cursor position

-- Appearance
opt.termguicolors = true -- Better colors (needs truecolor support on terminal) 
opt.background = 'dark' -- Sets the default vim scheme to dark mode 
opt.signcolumn = 'yes' -- Show sign column

-- Clipboard
opt.clipboard:append('unnamedplus') -- Use system clipboard as default register

-- Split windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

-- Swapfile
opt.swapfile = false -- Turn off swapfile
