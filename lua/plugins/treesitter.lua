return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master", -- futuramente a branch principal será a main
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local treesitterConfigs = require("nvim-treesitter.configs")
    treesitterConfigs.setup({
      ensure_installed = {
        "c",
        "go",
        "lua",
        "vim",
        "diff",
        "fish",
        "bash",
        "html",
        "tmux",
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
  end,
}
