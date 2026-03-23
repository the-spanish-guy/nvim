local M = {}

-- Tenta iniciar LSP manualmente para buffers sem nome,
-- usando o cwd como root_dir
local function start_lsp_for_unnamed(bufnr, filetype)
  local installed = require("mason-lspconfig").get_installed_servers()
  local lspconfig = require("lspconfig")
  local lsp_configs = require("lspconfig.configs")

  for _, server_name in ipairs(installed) do
    if lsp_configs[server_name] then
      local ok, server = pcall(function()
        return lspconfig[server_name]
      end)
      if ok and server then
        local default_config = {}
        pcall(function()
          default_config = server.document_config.default_config or {}
        end)
        local filetypes = default_config.filetypes or {}
        if vim.tbl_contains(filetypes, filetype) then
          vim.lsp.start(
            vim.tbl_extend("force", default_config, {
              name = server_name,
              root_dir = vim.fn.getcwd(),
            }),
            { bufnr = bufnr }
          )
          return
        end
      end
    end
  end
end

M.pick = function()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local previewers = require("telescope.previewers")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local original_buf = vim.api.nvim_get_current_buf()
  local buf_lines = vim.api.nvim_buf_get_lines(original_buf, 0, -1, false)

  local filetypes = vim.fn.getcompletion("", "filetype")

  local previewer = previewers.new_buffer_previewer({
    title = "Preview",
    define_preview = function(self, entry)
      vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, buf_lines)
      vim.bo[self.state.bufnr].filetype = entry.value
    end,
  })

  pickers.new({}, {
    prompt_title = "Selecionar tipo de arquivo",
    previewer = previewer,
    finder = finders.new_table({
      results = filetypes,
      entry_maker = function(ft)
        return { value = ft, display = ft, ordinal = ft }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local sel = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if not sel then return end

        vim.api.nvim_buf_call(original_buf, function()
          vim.cmd("set filetype=" .. sel.value)
        end)

        local bufname = vim.api.nvim_buf_get_name(original_buf)
        if bufname == "" then
          vim.schedule(function()
            start_lsp_for_unnamed(original_buf, sel.value)
          end)
        end
      end)
      return true
    end,
  }):find()
end

return M
