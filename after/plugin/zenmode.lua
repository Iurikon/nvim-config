require("zen-mode").setup({
  window = {
    options = {
      signcolumn = "no",
      number = false,
      relativenumber = false,
      foldcolumn = "0",
    }
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showdmc = false,
      colorcolumn = false,
    },
    lualine = { enabled = false }
  }
})

vim.api.nvim_set_keymap('n', '<leader>zm', ':ZenMode<CR>', { silent = true })
