return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = { "php", "javascript", "lua", "css", "html" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	}
}
