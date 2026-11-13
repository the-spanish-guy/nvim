local M = {}

local levels = vim.log.levels

local lang_map = {
  typescriptreact = "tsx",
  javascriptreact = "jsx",
  typescript = "ts",
  javascript = "js",
}

local function notify(msg, level)
  vim.notify(msg, level or levels.INFO)
end

--- Nome do arquivo do buffer atual, ou nil (com aviso) se não tiver nome.
---@return string?
local function buf_name()
  local name = vim.api.nvim_buf_get_name(0)
  if name == "" then
    notify("Buffer sem nome de arquivo", levels.WARN)
    return nil
  end
  return name
end

--- Raiz do projeto: raiz do git, ou o cwd se não houver repositório.
---@param name string
---@return string
local function project_root(name)
  return vim.fs.root(name, ".git") or vim.uv.cwd()
end

--- Sai do modo visual (se estiver nele) para a seleção não ficar ativa.
local function leave_visual()
  if vim.fn.mode():match("^[vV\22]") then
    vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "nx", false)
  end
end

--- Linhas cobertas pelo cursor ou, no visual, pela seleção.
---@return integer first, integer last
local function line_range()
  local a, b = vim.fn.line("v"), vim.fn.line(".")
  if vim.fn.mode():match("^[vV\22]") then
    return math.min(a, b), math.max(a, b)
  end
  return b, b
end

---@param absolute boolean
local function yank_path(absolute)
  local name = buf_name()
  if not name then
    return
  end
  local first, last = line_range()
  leave_visual()

  local path = vim.fn.fnamemodify(name, absolute and ":p" or ":.")
  path = path .. "#L" .. first
  if last ~= first then
    path = path .. "-L" .. last
  end
  vim.fn.setreg("+", path)
  notify("Copiado: " .. path)
end

--- Caminho relativo ao cwd com a linha (`#L42`); no visual, o intervalo.
function M.yank_relative_path_with_line()
  yank_path(false)
end

--- Caminho absoluto com a linha (`#L42`); no visual, o intervalo.
function M.yank_absolute_path_with_line()
  yank_path(true)
end

--- Copia as linhas da seleção como bloco Markdown:
--- ```ts filename="src/app.ts" line=10
function M.copy_as_codeblock()
  local name = buf_name()
  if not name then
    return
  end
  local first, last = line_range()
  leave_visual()

  local lines = vim.api.nvim_buf_get_lines(0, first - 1, last, false)
  local rel = vim.fs.relpath(project_root(name), name) or name
  local ft = vim.bo.filetype
  local lang = lang_map[ft] or ft

  -- cerca mais longa que qualquer sequência de crases dentro do trecho
  local longest = 2
  for _, l in ipairs(lines) do
    for ticks in l:gmatch("`+") do
      longest = math.max(longest, #ticks)
    end
  end
  local fence = string.rep("`", longest + 1)

  local header = ('%s%s filename="%s" line=%d'):format(fence, lang, rel, first)
  local text = header .. "\n" .. table.concat(lines, "\n") .. "\n" .. fence
  vim.fn.setreg("+", text)
  notify(("Copiadas %d linha(s) como bloco de código"):format(#lines))
end

--- `:restart` com proteção: recusa se houver buffer com alterações não salvas.
function M.restart()
  local dirty = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].modified and vim.bo[buf].buflisted then
      local name = vim.api.nvim_buf_get_name(buf)
      dirty[#dirty + 1] = name ~= "" and vim.fn.fnamemodify(name, ":t")
        or "[sem nome]"
    end
  end
  if #dirty > 0 then
    notify(
      "Há alterações não salvas: " .. table.concat(dirty, ", "),
      levels.WARN
    )
    return
  end
  vim.cmd("restart")
end

return M
