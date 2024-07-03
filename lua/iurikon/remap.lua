-- Function to check if GitHub Copilot's suggestions are available
local function has_copilot_suggestions()
  return vim.v.suggest_enable_popup == 1 and vim.v.suggest_selection ~= -1
end

vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Key mappings for buffer navigation
vim.api.nvim_set_keymap('n', '<C-h>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':bfirst<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':blast<CR>', { noremap = true, silent = true })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Emacs user keybinds lmao
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-K>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-J>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- Toggle NvimTree with Ctrl+N
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Switch between Neotree and current file with Ctrl+H and Ctrl+L
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true })

-- Switch between open files using Tab and Shift + Tab
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Tab', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Close the current buffer
vim.api.nvim_set_keymap('n', '<leader>bd', ':Bdelete<CR>', { noremap = true, silent = true })

-- Key mappings for netrw
vim.api.nvim_set_keymap('n', '<leader>ne', ':Lexplore<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nf', ':Rexplore<CR>', { noremap = true, silent = true })

-- Map Ctrl+J to accept Copilot suggestion
vim.api.nvim_set_keymap('i', '<C-j>', 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- go keybinds
vim.keymap.set(
  "n",
  "<leader>ee",
  "oif err != nil {<CR>}<Esc>0return err<Esc>"
)
