return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		DEFAULT_OPTIONS = {
			RGB      = true,
			RRGGBB   = true,
			names    = true,
		}
		require("colorizer").setup()
	end,
}
