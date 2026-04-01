-- mistura a cor semântica com o bg do tema, preservando a matiz
local function blend(color, bg, factor)
  local r1, g1, b1 = math.floor(color / 65536), math.floor((color % 65536) / 256), color % 256
  local r2, g2, b2 = math.floor(bg / 65536), math.floor((bg % 65536) / 256), bg % 256
  local r = math.floor(r1 * factor + r2 * (1 - factor))
  local g = math.floor(g1 * factor + g2 * (1 - factor))
  local b = math.floor(b1 * factor + b2 * (1 - factor))
  return r * 65536 + g * 256 + b
end

-- mapeia cada kind do LSP ao grupo semântico do tema para colorir o ícone (fg)
local kind_hl_links = {
  Function      = "@function",
  Method        = "@function.method",
  Constructor   = "@constructor",
  Class         = "@type",
  Interface     = "@type",
  Struct        = "@type",
  Enum          = "@type",
  EnumMember    = "@constant",
  Constant      = "@constant",
  Field         = "@variable.member",
  Property      = "@property",
  Variable      = "@variable",
  Module        = "@module",
  Keyword       = "@keyword",
  Snippet       = "@string",
  Text          = "@comment",
  Operator      = "@operator",
  Reference     = "@variable",
  TypeParameter = "@type",
  Unit          = "@number",
  Value         = "@number",
  Color         = "@string.special",
  File          = "@string",
  Folder        = "@string",
  Event         = "@constant",
  Key           = "@variable.member",
  Null          = "@constant.builtin",
  Array         = "@punctuation.bracket",
  Boolean       = "@boolean",
  Number        = "@number",
  Object        = "@type",
  Package       = "@module",
  String        = "@string",
  Namespace     = "@module",
}

-- aplica highlights nos kinds do LSP para o blink.cmp:
-- BlinkCmpKindIcon{Kind}: fg semântico + bg tintado
-- BlinkCmpKind{Kind}: só fg semântico
-- BlinkCmpMenuSelection: linkado ao CursorLine do tema
local function apply_blink_kind_highlights()
  local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg or 0
  vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { link = "CursorLine" })
  for kind, hl_group in pairs(kind_hl_links) do
    local semantic_color = vim.api.nvim_get_hl(0, { name = hl_group, link = false }).fg
    if semantic_color then
      vim.api.nvim_set_hl(0, "BlinkCmpKindIcon" .. kind, {
        fg = semantic_color,
        bg = blend(semantic_color, normal_bg, 0.2),
      })
      vim.api.nvim_set_hl(0, "BlinkCmpKind" .. kind, { fg = semantic_color })
    else
      vim.api.nvim_set_hl(0, "BlinkCmpKindIcon" .. kind, { link = hl_group })
      vim.api.nvim_set_hl(0, "BlinkCmpKind" .. kind, { link = hl_group })
    end
  end
end

return {
  blend = blend,
  apply_blink_kind_highlights = apply_blink_kind_highlights,
}
