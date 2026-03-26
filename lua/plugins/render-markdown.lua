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
      -- Inlined with 'image' elements.
      image = "󰥶 ",
      -- Check custom for 'image' elements.
      image_custom = true,
      latex = {
        -- Turn on / off latex rendering.
        enabled = true,
        -- Additional modes to render latex.
        render_modes = false,
        -- Executable used to convert latex formula to rendered unicode.
        -- If a list is provided the commands run in order until the first success.
        converter = { "utftex", "latex2text" },
        -- Highlight for latex blocks.
        highlight = "RenderMarkdownMath",
        -- Determines where latex formula is rendered relative to block.
        -- | above  | above latex block                               |
        -- | below  | below latex block                               |
        -- | center | centered with latex block (must be single line) |
        position = "center",
        -- Number of empty lines above latex blocks.
        top_pad = 0,
        -- Number of empty lines below latex blocks.
        bottom_pad = 0,
      },
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
