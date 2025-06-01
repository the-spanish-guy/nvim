return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      heading = {
        sign = true,
        icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
      },
      code = {
        sign = true,
        width = "full",
        right_pad = 1,
      },
      bullet = {
        -- Turn on / off list bullet rendering
        enabled = true,
      },
    },
  },
}
