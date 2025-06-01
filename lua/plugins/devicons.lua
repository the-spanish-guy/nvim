return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      -- ativar cores diferentes para cada ícone
      color_icons = true,
      -- ativar ícones padrão
      default = true,
      -- ativar modo estrito
      strict = true,
      -- sobrescrever especificamente por extensão
      override_by_extension = {
        ["controller.ts"] = {
          icon = "",
          color = "#60A5FA",
          name = "NestController"
        },
        ["service.ts"] = {
          icon = "",
          color = "#FBBF24",
          name = "NestService"
        },
        ["module.ts"] = {
          icon = "",
          color = "#F87171",
          name = "NestModule"
        },
        ["guard.ts"] = {
          icon = "",
          color = "#22C55E",
          name = "NestGuard"
        },
        ["middleware.ts"] = {
          icon = "",
          color = "#4F46E5",
          name = "NestMiddleware"
        },
        ["decorator.ts"] = {
          icon = "",
          color = "#A855F7",
          name = "NestDecorator"
        },
        ["pipe.ts"] = {
          icon = "",
          color = "#F87171",
          name = "NestPipe"
        },
        ["filter.ts"] = {
          icon = "",
          color = "#F87171",
          name = "NestFilter"
        },
        ["gateway.ts"] = {
          icon = "",
          color = "#F87171",
          name = "NestGateway"
        },
        ["provider.ts"] = {
          icon = "",
          color = "#F87171",
          name = "NestProvider"
        },
        ["resolver.ts"] = {
          icon = "",
          color = "#F87171",
          name = "NestResolver"
        }
      }
    })
  end,
} 