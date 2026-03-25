return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local treesitterConfigs = require("nvim-treesitter.configs")
    treesitterConfigs.setup({
      ensure_installed = {
        "c",
        "go",
        "lua",
        "vim",
        "css",
        "sql",
        "tsx",
        "diff",
        "fish",
        "bash",
        "html",
        "json",
        "tmux",
        "toml",
        "yaml",
        "latex",
        "jsdoc",
        "regex",
        "astro",
        "gomod",
        "gosum",
        "query",
        "gotmpl",
        "vimdoc",
        "python",
        "markdown",
        "gitignore",
        "typescript",
        "javascript",
        "markdown_inline",
      },
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
    })

    -- nvim-treesitter-textobjects foi reescrito e não usa mais nvim-treesitter.configs
    -- setup próprio com keymaps manuais
    require("nvim-treesitter-textobjects").setup({
      select = { lookahead = true },
      move = { set_jumps = true },
    })

    local select = require("nvim-treesitter-textobjects.select")
    local move = require("nvim-treesitter-textobjects.move")
    local swap = require("nvim-treesitter-textobjects.swap")

    -- Select
    local select_maps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
    }
    for key, query in pairs(select_maps) do
      vim.keymap.set({ "x", "o" }, key, function()
        select.select_textobject(query, "textobjects")
      end)
    end

    -- Move
    vim.keymap.set("n", "]f", function() move.goto_next_start("@function.outer", "textobjects") end)
    vim.keymap.set("n", "]c", function() move.goto_next_start("@class.outer", "textobjects") end)
    vim.keymap.set("n", "]F", function() move.goto_next_end("@function.outer", "textobjects") end)
    vim.keymap.set("n", "]C", function() move.goto_next_end("@class.outer", "textobjects") end)
    vim.keymap.set("n", "[f", function() move.goto_previous_start("@function.outer", "textobjects") end)
    vim.keymap.set("n", "[c", function() move.goto_previous_start("@class.outer", "textobjects") end)
    vim.keymap.set("n", "[F", function() move.goto_previous_end("@function.outer", "textobjects") end)
    vim.keymap.set("n", "[C", function() move.goto_previous_end("@class.outer", "textobjects") end)

    -- Swap
    vim.keymap.set("n", "<leader>sa", function()
      swap.swap_next("@parameter.inner", "textobjects")
    end)
    vim.keymap.set("n", "<leader>sA", function()
      swap.swap_previous("@parameter.inner", "textobjects")
    end)
  end,
}
