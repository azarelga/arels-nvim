-- defaults:
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.o.clipboard = 'unnamedplus'

-- ctrl c ctrl v
vim.api.nvim_set_keymap("x", "<D-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap("x", "<D-v>", '"+p', {noremap=true, silent=true})

-- biar ga pas hapus pake x 
-- clipboardnya ilang 
vim.keymap.set({'n', 'x'}, 'x', '"_x')

-- package manager
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')

  install_plugins = true
end

-- using packer
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

	-- dashboard
	use {
  	'glepnir/dashboard-nvim',
  	event = 'VimEnter',
		config = function()
		require('dashboard').setup { -- config
		}
  	end,
  	requires = {'nvim-tree/nvim-web-devicons'}
	}

	-- nvim tree
	use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	-- comment plugin
	use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
	}

	use {'nvim-treesitter/nvim-treesitter'}

	-- lsp and its installer
	use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
	}

	-- transparent theme
	use {"catppuccin/nvim", as = "catppuccin"}

	-- auto pairs
	use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
	}

	-- surround to change pairs easy
	use "tpope/vim-surround"

	-- coq nvim
	use 'ms-jpq/coq-nvim'
	use 'ms-jpq/coq.artifacts'

	-- terminal float
	use 'voldikss/vim-floaterm'

	-- lualine
	use { 'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup({
			})
		end,
	}

if install_plugins then
    require('packer').sync()
  end
end)

if install_plugins then
  return
end

require("mason").setup()
require("mason-lspconfig").setup()

-- lualine config
require('lualine').setup({
	options = {
		theme = 'OceanicNext'
	}
})

-- comment plugin config
require('Comment').setup({
	toggler = {
		line = '<leader>/'
	}
})

-- catppuccin config
require("catppuccin").setup({
	flavour = "macchiato",
	transparent_background = true,
	integrations = {
		nvimtree = true
	},
})

-- find it int lua/me
require("me.coq")
require("me.lsp")
require("me.treesitter")
require("me.nvim-tree")

-- floaterm config
vim.keymap.set('n','<c-x>',':FloatermToggle newterm<cr>')
vim.keymap.set('t','<c-x>','<C-\\><C-n>:FloatermToggle newterm<cr>')
vim.keymap.set('n','<c-p>',':FloatermNew  --name=calculator python3.10<cr>')
vim.keymap.set('t','<c-p>','<C-\\><C-n>:FloatermToggle calculator<cr>')
vim.keymap.set('n','<c-c>',':FloatermNew --autoclose=0 gcc % -o %< && ./%< <cr>')

-- keyboard shortcuts for plugins
vim.g.mapleader=' '
vim.keymap.set('n','<leader>t',':NvimTreeToggle <cr>')
vim.cmd[[colorscheme catppuccin]]

