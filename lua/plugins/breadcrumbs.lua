return {
  {
    "LunarVim/breadcrumbs.nvim",
    config = function()
      require("breadcrumbs").setup()
    end,
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      local icons = require("utils.icons")
      local navic = require("nvim-navic")

      require("nvim-navic").setup({
        highlight = true,
        lsp = {
          auto_attach = true,
          preference = { "typescript-tools" },
        },
        click = true,
        separator = " " .. icons.ui.ChevronRight .. " ",
        depth_limit = 0,
        on_attach = function(client, bufnr)
          navic.attach(client, bufnr)
        end,
        depth_limit_indicator = "..",
        lazy_update_context = false,
        icons = {
          File = " ",
          Module = " ",
          Namespace = " ",
          Package = " ",
          Class = " ",
          Method = " ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = " ",
          Interface = " ",
          Function = " ",
          Variable = " ",
          Constant = " ",
          String = " ",
          Number = " ",
          Boolean = " ",
          Array = " ",
          Object = " ",
          Key = " ",
          Null = " ",
          EnumMember = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
      })
    end,
  },
}
