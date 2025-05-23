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
    build = ':TSUpdate',
  },
  { 'nvim-treesitter/playground' },
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
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim' },
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
