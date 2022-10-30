local nvimtree = require("nvim-tree")

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#89B4FA]])
--

nvimtree.setup({
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "",
					arrow_open = "",
				},
			},
		},
	},
	-- disable window_picker for explorer to work well with window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
