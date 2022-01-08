require('utils.plugin')
local plugins={
	Plugin:new({'tamago324/nlsp-settings.nvim'},"nlsp-settings"),
	Plugin:new({'tpope/vim-fugitive'},"fugitive"),
	Plugin:new({'folke/which-key.nvim',},"which-key"),
	Plugin:new({'neovim/nvim-lspconfig'}),
	Plugin:new({'unblevable/quick-scope'}, 'quick-scope'),
	Plugin:new({'williamboman/nvim-lsp-installer'}),
	Plugin:new({'akinsho/toggleterm.nvim'},'toggleterm'),

	Plugin:new({
  'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
},"lualine"),
	Plugin:new({'Mofiqul/dracula.nvim'}),
	Plugin:new({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
},'nvim-tree'),

  -- Smooth scroll
	Plugin:new({'psliwka/vim-smoothie',},'vim-smoothie'),

	--Org mode
  Plugin:new({ "nvim-neorg/neorg", requires = "nvim-lua/plenary.nvim"}, "neorg"),
  -- Tree Sitter
	--
  Plugin:new({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }, 'nvim-treesitter'),
  Plugin:new({'windwp/nvim-ts-autotag',}),
  Plugin:new({'nvim-treesitter/nvim-treesitter-refactor',}),
  Plugin:new({'nvim-treesitter/playground',}),
  Plugin:new({'romgrk/nvim-treesitter-context',}),
  -- Telescope and extensions
  Plugin:new({'nvim-telescope/telescope.nvim',},'telescope'),
  Plugin:new({'nvim-lua/plenary.nvim',}),
  Plugin:new({'nvim-lua/popup.nvim',}),
  Plugin:new({'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }),
  Plugin:new({'nvim-telescope/telescope-symbols.nvim',}),
  Plugin:new({'nvim-telescope/telescope-github.nvim',}),
  Plugin:new({'nvim-telescope/telescope-frecency.nvim',}),
  -- Sql using plugin
  Plugin:new({'tami5/sql.nvim',}),
  -- surroundings": parentheses, brackets, quotes vs.
  Plugin:new({'tpope/vim-surround',}),
	-- Dashboard
  Plugin:new({'glepnir/dashboard-nvim',},'dashboard'),
	-- Tabline
  Plugin:new({
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}},'barbar'),
	-- Project manager
  Plugin:new({
  "ahmedkhalf/project.nvim",
},'project'),


	-- Motions
  -- Plugin:new({'easymotion/vim-easymotion',},'vim-easymotion'),
  Plugin:new({'phaazon/hop.nvim',},'hop'),
  -- Completion engine
  --Plug 'hrsh7th/cmp-nvim-lsp'
  Plugin:new({
      "hrsh7th/nvim-cmp",
      requires = {
          "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
          'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
          'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
          'f3fora/cmp-spell', 'hrsh7th/cmp-emoji', 'hrsh7th/cmp-cmdline', 
					'L3MON4D3/LuaSnip','saadparwaiz1/cmp_luasnip','rafamadriz/friendly-snippets'
      }
  },'nvim-cmp'),
  Plugin:new({'numToStr/Comment.nvim',}, "comment"),

	-- Snippet engine
  Plugin:new({'L3MON4D3/LuaSnip',}),
  Plugin:new({'saadparwaiz1/cmp_luasnip',}),
  Plugin:new({'rafamadriz/friendly-snippets',}),
}


local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  -- My plugins here
  for _, plugin in ipairs(plugins) do
    use(plugin.use)
	end
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if Packer_bootstrap then
    require('packer').sync()
  end
end)

for _, plugin in ipairs(plugins) do
	if plugin.config ~= nil then
    if not pcall(require,"plugins."..plugin.config) then
      print("Failed to load plugin : "..plugin.config)
    end
	end
end




