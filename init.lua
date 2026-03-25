vim.g.mapleader = " "

vim.deprecate = function() end

require("settings")

pcall(require, "theme")

