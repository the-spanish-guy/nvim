return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local telescopeBuiltin = require("telescope.builtin")
      local icons = require("utils.icons")

      local function formattedName(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == "." then
          return tail
        end
        return string.format("%s\t\t%s", tail, parent)
      end

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
          file_ignore_patterns = { "node_modules", "*-lock.json" },
          selection_caret = icons.ui.DoubleChevronRight .. " ",
          prompt_prefix = " " .. icons.ui.Telescope .. " ",
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" },
          layout_config = {
            height = 0.4,
            prompt_position = "bottom",
            preview_cutoff = 120,
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              previewer = true,
              prompt_prefix = " " .. icons.ui.Search .. " ",
              initial_mode = "insert",
              sorting_strategy = "ascending",
              layout_strategy = "horizontal",
              layout_config = {
                prompt_position = "top",
                horizontal = {
                  width = 0.5,
                  preview_width = 0.6,
                },
              },
            }),
          },
        },
        pickers = {
          find_files = {
            previewer = true,
            path_display = formattedName,
            layout_config = {
              height = 0.4,
              prompt_position = "bottom",
              preview_cutoff = 120,
            },
          },
          live_grep = {
            only_sort_text = true,
            previewer = true,
          },
          treesitter = {
            show_line = true,
            previewer = true,
          },
          colorscheme = {
            enable_preview = true,
          },
        },
      })
      telescope.load_extension("ui-select")
      vim.keymap.set("n", "<C-p>", telescopeBuiltin.find_files, {})
      vim.keymap.set("n", "<leader>fg", telescopeBuiltin.live_grep, {})
    end,
  },
}
