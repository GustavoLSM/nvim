-- Local variables
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim' -- Set lazy vim plugin manager path

-- Lazy plugin manager
if not (vim.uv or vim.loop).fs_stat(lazypath) then -- Clone Lazy vim if not installed on the computer
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('gustavo.plugins') -- Load Lazy vim
