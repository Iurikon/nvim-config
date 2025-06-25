-- Detect the appropriate shell based on the operating system
local function get_shell()
  if vim.fn.has("win32") == 1 then
    return "pwsh"
  else
    return "zsh"
  end
end

require("toggleterm").setup({
  direction = "float",
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
  auto_scroll = true,
  start_in_insert = true,
  shell = get_shell(),
})
