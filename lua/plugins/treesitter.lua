return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitterConfigs = require("nvim-treesitter.configs")
    treesitterConfigs.setup({
      ensure_installed = {
        "c",
        "go",
        "lua",
        "vim",
        "bash",
        "html",
        "regex",
        "gomod",
        "gosum",
        "query",
        "gotmpl",
        "vimdoc",
        "python",
        "markdown",
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
