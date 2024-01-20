function splitString(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

local colorscheme = vim.api.nvim_command_output("colorscheme")
local splittedThemeName = splitString(colorscheme, "-")
local themeName = splittedThemeName[#splittedThemeName]

return themeName
