return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		preset = "classic",
		--win = { border = "single" },
		vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "#1a1a1a", blend = 90 }), -- Fondo semi-transparente
	},
}

