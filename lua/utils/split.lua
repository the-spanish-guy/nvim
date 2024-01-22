local function splitString(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

local colorscheme = vim.api.nvim_command_output("colorscheme") -- pega o colorscheme setado -> catppuccin-mocha
local splittedThemeName = splitString(colorscheme, "-") -- split por '-' e retorna -> [catppuccin, mocha]
local themeName = splittedThemeName[#splittedThemeName] -- retorna o ultimo indice 

return themeName


