vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
}
  }
local opts = {}

require("lazy").setup(plugins, opts)

local treesitterConfigs = require("nvim-treesitter.configs")
treesitterConfigs.setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "html" },
          sync_install = true,
          highlight = { enable = true },
          indent = { enable = true },
})

require("neo-tree").setup({
  window = {
    position = "right",
    mappings = {
      ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
    },
    filesystem = {
      follow_current_file = {
        enabled = true
      }
    },
    buffers = {follow_current_file = {
        enabled = true
      }

    }
  }
})
vim.keymap.set('n', '<C-b>', ':Neotree<CR>')

local telescopeBuiltin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', telescopeBuiltin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescopeBuiltin.live_grep, {})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
