return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "right",
				mappings = {
					["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
				},
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
				},
				buffers = {
					follow_current_file = {
						enabled = true,
					},
				},
			},
		})
		vim.keymap.set("n", "<C-b>", ":Neotree<CR>")
	end,
}
