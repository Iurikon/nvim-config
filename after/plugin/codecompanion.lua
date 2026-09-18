local ok, codecompanion = pcall(require, 'codecompanion')
if not ok then
  vim.notify('CodeCompanion not found!', vim.log.levels.WARN)
  return
end

-- Resolve the DeepSeek key from the environment, falling back to a key file, so a
-- stale tmux/shell environment can't send the literal variable name as the key.
local deepseek_key_file = vim.fs.joinpath(vim.fn.expand('~'), '.deepseek_api_key')

local function deepseek_api_key()
  local key = vim.env.DEEPSEEK_API_KEY
  if key and key ~= '' then
    return key
  end

  local ok_read, lines = pcall(vim.fn.readfile, deepseek_key_file)
  if ok_read and lines[1] and vim.trim(lines[1]) ~= '' then
    return vim.trim(lines[1])
  end

  error(
    'DeepSeek: no API key. Export DEEPSEEK_API_KEY in the shell that starts Neovim '
      .. '(tmux panes keep a stale environment - use a new pane) or put the key in '
      .. deepseek_key_file
  )
end

codecompanion.setup({
  adapters = {
    http = {
      deepseek = function()
        return require('codecompanion.adapters').extend('deepseek', {
          env = { api_key = deepseek_api_key },
          schema = {
            model = {
              default = 'deepseek-flash', -- DeepSeek V4.1 Flash (canonical model id)
              choices = {
                ['deepseek-flash'] = {
                  formatted_name = 'DeepSeek V4.1 Flash',
                  meta = { context_window = 1048576 },
                  opts = { can_reason = true, can_use_tools = true },
                },
                ['deepseek-v4-pro'] = {
                  formatted_name = 'DeepSeek V4 Pro',
                  meta = { context_window = 1048576 },
                  opts = { can_reason = true, can_use_tools = true },
                },
              },
            },
          },
        })
      end,
    },
  },
  interactions = {
    -- DeepSeek is the default; press `ga` in the chat buffer to switch to Copilot.
    chat = {
      adapter = { name = 'deepseek', model = 'deepseek-flash' },
      tools = {
        opts = {
          -- Preloaded in every new chat. The `agent` group brings shell access
          -- (run_command) plus file ops, search and diagnostics; approvals still apply.
          default_tools = { 'agent', 'fetch_webpage', 'memory', 'search_help' },
        },
      },
    },
    inline = {
      adapter = { name = 'deepseek', model = 'deepseek-flash' },
    },
  },
  display = {
    chat = {
      window = {
        layout = 'vertical',
        position = 'right', -- dock on the right, like the VS Code chat panel
        width = 0.35,
        full_height = true,
        opts = {
          number = false,
          relativenumber = false,
          signcolumn = 'no',
          winfixwidth = true, -- keep the dock width when other splits open
        },
      },
    },
  },
})

-- `:CodeCompanionActions` is context aware (Explain/Fix/Tests/LSP...) and works on visual selections.
-- Inside the chat buffer use the built-in slash commands: /explain /fix /unit_tests /commit /lsp.
vim.keymap.set('n', '<leader>cc', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'CodeCompanion: chat panel' })
vim.keymap.set('n', '<leader>ca', '<cmd>CodeCompanionActions<CR>', { desc = 'CodeCompanion: actions' })
vim.keymap.set('v', '<leader>ca', '<cmd>CodeCompanionActions<CR>', { desc = 'CodeCompanion: actions (selection)' })
