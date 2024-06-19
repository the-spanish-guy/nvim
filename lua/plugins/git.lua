return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local icons = require("utils.icons")
      require("gitsigns").setup({

        auto_attach = true,
        signs = {
          add = {
            text = icons.ui.BoldLineLeft,
          },
          change = {
            text = icons.ui.BoldLineLeft,
          },
          delete = {
            text = icons.ui.TriangleShortArrowRight,
          },
          topdelete = {
            text = icons.ui.TriangleShortArrowRight,
          },
          changedelete = {
            text = icons.ui.BoldLineLeft,
          },
        },
        signcolumn = true,         -- Toggle with `:Gitsigns toggle_signs`
        numhl = false,             -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,            -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false,         -- Toggle with `:Gitsigns toggle_word_diff`
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
      })
    end,
  },
  { "tpope/vim-fugitive" },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
    },
    config = function()
      -- see https://github.com/sindrets/diffview.nvim/blob/main/USAGE.md
      require("diffview").setup({
        keymaps = {
          file_panel = {
            {
              "n",
              "<leaeder>cc",
              function()
                vim.ui.input({ prompt = "Commit message: " }, function(msg)
                  if not msg then
                    return
                  end
                  local results = vim
                      .system({ "git", "commit", "-m", msg }, { text = true })
                      :wait()

                  if results.code ~= 0 then
                    vim.notify(
                      "Commit failed with the message: \n"
                      .. vim.trim(results.stdout .. "\n" .. results.stderr),
                      vim.log.levels.ERROR,
                      { title = "Commit" }
                    )
                  else
                    vim.notify(
                      results.stdout,
                      vim.log.levels.INFO,
                      { title = "Commit" }
                    )
                  end
                end)
              end,
            },
          },
        },
      })
    end,
  },
  { "mbbill/undotree" },
}

-- add comment teste
