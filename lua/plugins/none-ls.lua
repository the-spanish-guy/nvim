return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.diagnostics.eslint_d,
				},
				debug = true,
				temp_dir = "/tmp",
				update_in_insert = true,
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

			-- move config to lsp-config.lua
			-- vim.diagnostic.config({ update_in_insert = true })
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				-- ensure_installed = { "stylua", "prettier" },
				ensure_installed = nil,
				automatic_installation = true,
			})
		end,
	},
}
