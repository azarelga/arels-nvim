-- catppuccin config
require("catppuccin").setup({
	flavour = "macchiato",
	integrations = {
		nvimtree = true,
		mason = true,
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
			},
			underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
			},
		},
		markdown = true,
	},
})
