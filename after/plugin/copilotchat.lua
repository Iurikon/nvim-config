local status_ok, copilot_chat = pcall(require, "CopilotChat")
if not status_ok then
  vim.notify("CopilotChat not found!", vim.log.levels.WARN)
  return
end

copilot_chat.setup({
  -- debug = true, -- Enable for debugging if issues persist
  default_options = {
    layout = {
      window = {
        width = 0.5, -- 50% of the screen width
        height = 1, -- Full height
        border = "single",
        position = "right", -- Open to the right
        relative = "editor", -- Relative to the current editor window
        title = "Copilot Chat",
      },
      preview = {
        width = 0.5,
        height = 0.4,
        border = "single",
        position = "bottom",
        relative = "win",
        title = "Preview",
      }
    }
  }
})

-- Keymap for CopilotChat
vim.api.nvim_set_keymap('n', '<leader>cpc', '<cmd>CopilotChat<CR>', { noremap = true, silent = true, desc = "Open Copilot Chat" })
-- Example for other actions if you want to add them here:
-- vim.api.nvim_set_keymap('n', '<leader>cpe', '<cmd>CopilotChatExplain<CR>', { noremap = true, silent = true, desc = "CopilotChat Explain" })
-- vim.api.nvim_set_keymap('v', '<leader>cpt', '<cmd>CopilotChatTests<CR>', { noremap = true, silent = true, desc = "CopilotChat Tests (Visual)" }) 