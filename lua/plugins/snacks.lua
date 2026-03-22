local icons = require("utils.icons")

local function make_sections()
  local sections = {
    { section = "header", pane = 1 },
    { pane = 2, padding = 6 },
    { section = "keys", pane = 2, gap = 1 },
    { pane = 2, padding = 2 },
    {
      pane = 2,
      text = { { "🦋 No will to break", hl = "SnacksDashboardFooter", align = "center" } },
    },
    {
      pane = 2,
      text = { { "🗡️  No mind to think", hl = "SnacksDashboardFooter", align = "center" } },
    },
    {
      pane = 2,
      text = { { "🎭 Born of God and Void", hl = "SnacksDashboardFooter", align = "center" } },
    },
    {
      pane = 2,
      text = { { "🪲 No voice to cry suffering", hl = "SnacksDashboardFooter", align = "center" } },
    },
    { pane = 2, padding = 1 },
  }

  local zote = require("utils.zote_precepts")
  local lines = zote.get_random_precept()
  for i, line in ipairs(lines) do
    local prefix = i == 1 and "> " or "  "
    table.insert(sections, {
      pane = 2,
      text = { { prefix .. line, hl = "SnacksDashboardDesc", align = "center" } },
    })
  end

  return sections
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    words = { enabled = true },
    lazygit = { enabled = true },
    dashboard = {
      width = 60,
      pane_gap = 8,
      preset = {
        header = table.concat(
          require("utils.headers").headers.zote_100,
          "\n"
        ),
        keys = {
          {
            icon = icons.ui.NewFile,
            key = "e",
            desc = "New File",
            action = ":ene | startinsert",
          },
          {
            icon = icons.ui.FindFile,
            key = "f",
            desc = "Find File",
            action = ":Telescope find_files",
          },
          {
            icon = icons.ui.Files,
            key = "r",
            desc = "Recent Files",
            action = ":Telescope oldfiles",
          },
          {
            icon = icons.ui.Gear,
            key = "s",
            desc = "Settings",
            action = ":e $MYVIMRC",
          },
          {
            icon = icons.ui.BoldClose,
            key = "q",
            desc = "Quit",
            action = ":qa",
          },
        },
      },
      sections = make_sections(),
    },
  },
  keys = {
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "LazyGit",
    },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
  },
}
