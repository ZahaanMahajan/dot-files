return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	opts = {
		lsp = { settings = { lineLength = 150 } },
	},
	config = true,
}
