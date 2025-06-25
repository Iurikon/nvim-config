local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set mapleader before loading plugins
vim.g.mapleader = " "

require("lazy").setup("iurikon.plugins")

require("iurikon.set")
require("iurikon.remap")

if vim.g.neovide then
  vim.g.neovide_transparency = 0.9
  vim.o.guifont = "CaskaydiaMono Nerd Font Mono:12"
  vim.g.neovide_scale_factor = 0.8
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1