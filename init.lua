require("iurikon.packer")
require("iurikon.set")
require("iurikon.remap")
require("iurikon.init")

if vim.g.neovide then
  vim.g.neovide_transparency = 0.9
  vim.o.guifont = "CaskaydiaMono Nerd Font Mono:12"
  vim.g.neovide_scale_factor = 0.8
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.laststatus = 2