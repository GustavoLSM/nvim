-- Indent guide lines
return {
    'lukas-reineke/indent-blankline.nvim', -- Clone the guide lines plugin
    event = { 'BufReadPre', 'BufNewFile' }, -- Only show on open files
    main = 'ibl', -- Engine for the guide lines
    opts = {
        indent = { char = '|' }, -- Symbol for the lines
    },
}
