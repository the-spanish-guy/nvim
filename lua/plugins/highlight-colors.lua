return {
  "brenoprata10/nvim-highlight-colors",
  event = { "BufReadPost", "BufNewFile" },
  init = function()
    -- O plugin já consulta o LSP (documentColor) sozinho; o nativo do 0.12
    -- pintaria a mesma faixa de novo
    vim.lsp.document_color.enable(false)
  end,
  opts = {
    render = "background",
    enable_hex = true,
    enable_short_hex = true,
    enable_rgb = true,
    enable_hsl = true,
    enable_var_usage = true,
    enable_named_colors = true,
    enable_tailwind = true,
  },
}
