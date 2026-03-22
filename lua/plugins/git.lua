return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local icons = require("utils.icons")
      require("gitsigns").setup({
        auto_attach = true,
        signs = {
          add = { text = icons.ui.BoldLineLeft },
          change = { text = icons.ui.BoldLineLeft },
          delete = { text = icons.ui.TriangleShortArrowRight },
          topdelete = { text = icons.ui.TriangleShortArrowRight },
          changedelete = { text = icons.ui.BoldLineLeft },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
        on_attach = function(bufnr)
          local gs = require("gitsigns")
          local map = function(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
          end

          map({ "n", "v" }, "<leader>gs", gs.stage_hunk, "Stage hunk")
          map({ "n", "v" }, "<leader>gr", gs.reset_hunk, "Reset hunk")
          map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")
          map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
        end,
      })
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },
    keys = {
      { "<leader>df", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
      { "<leader>dfh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview file history" },
    },
    config = function()
      require("diffview").setup({
        keymaps = {
          view = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
          },
          file_panel = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
          },
          file_history_panel = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
          },
        },
      })
    end,
  },
  { "mbbill/undotree" },
}
