local M = {}

M.pick = function()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local previewers = require("telescope.previewers")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local utils_path = vim.fn.stdpath("config") .. "/lua/utils"
  local samples = {
    { file = "theme_sample.lua", ft = "lua" },
    { file = "theme_sample.ts",  ft = "typescript" },
    { file = "theme_sample.go",  ft = "go" },
  }
  math.randomseed(vim.loop.hrtime())
  local sample = samples[math.random(#samples)]
  local sample_lines = vim.fn.readfile(utils_path .. "/" .. sample.file)

  local code_previewer = previewers.new_buffer_previewer({
    title = "Exemplo (" .. sample.ft .. ")",
    define_preview = function(self)
      vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, sample_lines)
      vim.bo[self.state.bufnr].filetype = sample.ft
    end,
  })

  -- Descobre temas e variantes
  local themes_path = vim.fn.stdpath("config") .. "/lua/themes"
  local files = vim.fn.glob(themes_path .. "/*.lua", false, true)
  local entries = {}

  for _, f in ipairs(files) do
    local name = vim.fn.fnamemodify(f, ":t:r")
    if name ~= "init" then
      package.loaded["themes." .. name] = nil
      local ok, t = pcall(require, "themes." .. name)
      if ok then
        if t.variants then
          for _, variant in ipairs(t.variants) do
            table.insert(entries, {
              theme = name,
              variant = variant,
              display = name .. " / " .. variant,
            })
          end
        else
          table.insert(entries, { theme = name, variant = nil, display = name })
        end
      end
    end
  end

  local original_name = require("themes").name
  local confirmed = false

  -- Atualiza o flavor dentro do arquivo do tema
  local function set_variant(theme_name, variant)
    local theme_file = themes_path .. "/" .. theme_name .. ".lua"
    local lines = vim.fn.readfile(theme_file)
    for i, line in ipairs(lines) do
      if line:match("^local flavor%s*=") then
        lines[i] = 'local flavor = "' .. variant .. '" -- mocha | latte | frappe | macchiato'
        break
      end
    end
    vim.fn.writefile(lines, theme_file)
  end

  local function apply_theme(entry, notify_on_fail)
    if entry.variant then
      set_variant(entry.theme, entry.variant)
    end
    package.loaded["themes." .. entry.theme] = nil
    local ok, t = pcall(require, "themes." .. entry.theme)
    if not ok then return false end
    local setup_ok, _ = pcall(t.setup)
    if not setup_ok and notify_on_fail then
      vim.notify(
        'Tema "' .. entry.display .. '" salvo, mas o plugin não está instalado.\nRode :Lazy sync e reinicie o Neovim.',
        vim.log.levels.WARN
      )
      return false
    end
    if setup_ok then
      pcall(require("utils.lualine_setup").apply, t)
    end
    return setup_ok
  end

  local function revert()
    local t = require("themes." .. original_name)
    pcall(t.setup)
    pcall(require("utils.lualine_setup").apply, t)
  end

  pickers.new({}, {
    prompt_title = "Selecionar tema",
    previewer = code_previewer,
    finder = finders.new_table({
      results = entries,
      entry_maker = function(entry)
        return { value = entry, display = entry.display, ordinal = entry.display }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      local function preview()
        local sel = action_state.get_selected_entry()
        if sel then apply_theme(sel.value, false) end
      end

      map({ "i", "n" }, "<Down>", function()
        actions.move_selection_next(prompt_bufnr)
        preview()
      end)
      map({ "i", "n" }, "<Up>", function()
        actions.move_selection_previous(prompt_bufnr)
        preview()
      end)
      map("n", "j", function()
        actions.move_selection_next(prompt_bufnr)
        preview()
      end)
      map("n", "k", function()
        actions.move_selection_previous(prompt_bufnr)
        preview()
      end)

      -- Confirmar: salva init.lua e aplica
      actions.select_default:replace(function()
        confirmed = true
        local sel = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if sel then
          local entry = sel.value
          local init_file = themes_path .. "/init.lua"
          vim.fn.writefile(
            { 'return require("themes.' .. entry.theme .. '")' },
            init_file
          )
          apply_theme(entry, true)
        end
      end)

      -- Cancelar: reverte para o tema original
      vim.api.nvim_create_autocmd("BufUnload", {
        buffer = prompt_bufnr,
        once = true,
        callback = function()
          if not confirmed then revert() end
        end,
      })

      return true
    end,
  }):find()
end

return M
