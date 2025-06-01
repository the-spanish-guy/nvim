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
    vim.g.mkdp_open_ip = "127.0.0.1"
    vim.g.mkdp_port = "8888"

    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_refresh_slow = 0

    vim.g.mkdp_auto_start = 1

    vim.g.mkdp_auto_close = 1

    vim.g.mkdp_page_title = "「${name}」"

    vim.g.mkdp_preview_options = {
      mkit = {},
      katex = {},
      uml = {},
      maid = {},
      disable_sync_scroll = 0,
      sync_scroll_type = "middle",
      hide_yaml_meta = 1,
      sequence_diagrams = {},
      flowchart_diagrams = {},
      content_editable = false,
      disable_filename = 0,
      toc = {},
    }
  end,
  ft = { "markdown" },
}
