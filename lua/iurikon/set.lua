-- Get home directory for portability
local function get_home_directory()
    if vim.fn.has("win32") == 1 then
        return vim.fn.expand("$USERPROFILE")
    else
        return vim.fn.expand("$HOME")
    end
end

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = get_home_directory() .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- LSP Diagnostic Configuration
vim.diagnostic.config({
  virtual_text = true, -- Show error text inline
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  underline = true, -- Underline errors
  update_in_insert = false, -- Don't update diagnostics while typing
  severity_sort = true, -- Sort diagnostics by severity
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
