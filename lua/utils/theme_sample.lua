-- Theme Preview Sample

local M = {}

local TIMEOUT = 3000
local API_URL = "https://api.example.com"

---@param name string
---@param opts? table
function M.greet(name, opts)
  opts = opts or {}
  local loud = opts.loud or false

  if type(name) ~= "string" then
    error("expected string, got " .. type(name))
  end

  local msg = string.format("Hello, %s!", name)

  if loud then
    return msg:upper()
  end

  return msg
end

local Animal = {}
Animal.__index = Animal

function Animal.new(kind, sound)
  return setmetatable({ kind = kind, sound = sound }, Animal)
end

function Animal:speak()
  return string.format("The %s says: %s", self.kind, self.sound)
end

local function fetch(url, callback)
  local ok, result = pcall(function()
    return { status = 200, body = "ok" }
  end)

  if not ok then
    vim.notify("Request failed: " .. result, vim.log.levels.ERROR)
    return nil
  end

  return callback(result)
end

local items = { "apple", "banana", "cherry" }

for i, item in ipairs(items) do
  local upper = item:sub(1, 1):upper() .. item:sub(2)
  items[i] = upper
end

local map = vim.tbl_map(function(x)
  return x .. "!"
end, items)

-- TODO: handle edge cases
-- FIXME: timeout not respected
local result = fetch(API_URL .. "/data", function(res)
  if res.status ~= 200 then
    return false
  end
  return res.body
end)

vim.schedule(function()
  local dog = Animal.new("dog", "woof")
  print(dog:speak())
  print(M.greet("world", { loud = true }))
  print(result or "no result")
end)

return M
