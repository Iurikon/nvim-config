return {
  -- Packer can manage itself (lazy.nvim manages itself)
  -- 'wbthomason/packer.nvim', -- No longer needed

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },

  { 'folke/tokyonight.nvim', name = 'tokyonight' },
  { 'folke/zen-mode.nvim' },
  { 'folke/which-key.nvim' },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
  },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.4', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'ThePrimeagen/harpoon' },
  { 'mbbill/undotree' },
  { 'rrethy/vim-hexokinase' },
  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        -- You can try uncommenting the line below if the error persists after updating
        -- and restarting. This makes operations synchronous, which might avoid the error.
        async = false,
      })
    end,
  },
  { 'goolord/alpha-nvim' },
  { 'lukas-reineke/indent-blankline.nvim' },
  { 'famiu/bufdelete.nvim' },

  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
      -- Your existing remap for <C-j> in remap.lua should still work
      -- vim.api.nvim_set_keymap('i', '<C-j>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },

  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
  },
  { 'rmagatti/auto-session' },

  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
    },
  },

  {
    'johnseth97/codex.nvim',
    cmd = { 'Codex', 'CodexToggle' },
    keys = {
      {
        '<leader>cx',
        function()
          require('codex').toggle()
        end,
        desc = 'Toggle Codex panel',
        mode = { 'n', 't' },
      },
    },
    init = function()
      -- Strip editor chrome from the Codex panel so it looks like a chat sidebar.
      vim.api.nvim_create_autocmd({ 'BufWinEnter', 'WinEnter', 'TermOpen' }, {
        group = vim.api.nvim_create_augroup('CodexPanel', { clear = true }),
        callback = function(args)
          if vim.bo[args.buf].filetype ~= 'codex' then
            return
          end
          vim.wo.number = false
          vim.wo.relativenumber = false
          vim.wo.signcolumn = 'no'
          vim.wo.winfixwidth = true -- keep the dock width when other splits open
        end,
      })
    end,
    opts = {
      keymaps = {
        toggle = nil,
        quit = '<C-g>',
      },
      panel = true, -- dock to the right in a vertical split instead of floating
      width = 0.35, -- panel width as a fraction of the editor columns
      autoinstall = true,
      use_buffer = false,
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },

      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    },
  },
} 
