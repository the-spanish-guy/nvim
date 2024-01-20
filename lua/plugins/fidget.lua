return {
  "j-hui/fidget.nvim",
  branch = "legacy",
  enabled = true,
  config = function()
    require("fidget").setup({
      notification = {
        window = {
          winblend = 0,
        },
      },
      window = { blend = 0 },
    })
  end,
}
