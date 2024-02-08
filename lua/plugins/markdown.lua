-- install with yarn or npm
-- install with yarn or npm
-- install with yarn or npm
-- install with yarn or npm
-- install without yarn or npm
--[[{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
}]]

return
-- install with yarn or npm
{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_refresh_slow = 0

    vim.g.mkdp_auto_start = 1

    vim.g.mkdp_auto_close = 1

    vim.g.mkdp_page_title = "「${name}」"
  end,
  ft = { "markdown" },
}
