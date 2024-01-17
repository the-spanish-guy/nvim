return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitterConfigs = require("nvim-treesitter.configs")
		treesitterConfigs.setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "html" },
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
      auto_install = true
		})
	end,
}
