return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local icons = require("utils.icons")
      require("gitsigns").setup({

        auto_attach = true,
        signs = {
          add = {
            hl = "GitSignsAdd",
            text = icons.ui.BoldLineLeft,
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn",
          },
          change = {
            hl = "GitSignsChange",
            text = icons.ui.BoldLineLeft,
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          delete = {
            hl = "GitSignsDelete",
            text = icons.ui.TriangleShortArrowRight,
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          topdelete = {
            hl = "GitSignsDelete",
            text = icons.ui.TriangleShortArrowRight,
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          changedelete = {
            hl = "GitSignsChange",
            text = icons.ui.BoldLineLeft,
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
        },
      })
    end,
  },
  { "tpope/vim-fugitive" },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
      require("diffview").setup({
        keymaps = {
          view = {
            {
              "n",
              "<leader>c",
              function()
                vim.ui.input({ prompt = "Commit message: " }, function(msg)
                  if not msg then
                    return
                  end
                  local results = vim.system({ "git", "commit", "-m", msg }, { text = true }):wait()

                  if results.code ~= 0 then
                    vim.notify(
                      "Commit failed with the message: \n" .. vim.trim(results.stdout .. "\n" .. results.stderr),
                      vim.log.levels.ERROR,
                      { title = "Commit" }
                    )
                  else
                    vim.notify(results.stdout, vim.log.levels.INFO, { title = "Commit" })
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
