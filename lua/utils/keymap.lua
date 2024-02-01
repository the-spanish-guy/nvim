function keymap(mode, keys, func, desc, opts)
  local localOpts = opts or { noremap = true, silent = true }
  if desc then
    localOpts.desc = "LSP: " .. desc
  end

  vim.keymap.set(mode, keys, func, localOpts)
end

return keymap
