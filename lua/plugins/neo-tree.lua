return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<C-b>",
      ":Neotree toggle<CR>",
      silent = true,
      desc = "open file explorer",
    },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,

      default_component_configs = {
        indent = {
          with_markers = true,
          with_expanders = true,
        },
        modified = {
          symbol = " ",
          highlight = "NeoTreeModified",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "✚",
            deleted = "✖",
            modified = "◍",
            renamed = "→",
            -- Status type
            untracked = "?",
            ignored = "◌",
            unstaged = "○",
            staged = "●",
            conflict = "!"
          },
        },
      },
      window = {
        position = "right",
        mappings = {
          ["P"] = {
            "toggle_preview",
            config = { use_float = true, use_image_nvim = true },
          },
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          hide_dotfiles = true, --hide .someFolder/
          hide_hidden = false,
        },
        always_show_by_pattern = {
          ".env*",
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
        },
      },
    })
    -- vim.keymap.set("n", "<C-b>", ":Neotree<CR>")
  end,
}
