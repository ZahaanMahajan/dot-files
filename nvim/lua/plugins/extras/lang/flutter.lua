return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	opts = {
		lsp = { settings = { lineLength = 120 } },
	},
	config = true,
}
