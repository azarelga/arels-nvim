-- defaults:
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.hlsearch = false
vim.g.did_load_filetypes = 1
vim.opt.wrap = true
vim.o.clipboard = 'unnamedplus'

-- ctrl c ctrl v
vim.api.nvim_set_keymap("x", "<D-c>", '"*y :let @+=@*<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<D-v>", '"+p', { noremap = true, silent = true })

-- biar ga pas hapus pake x
-- clipboardnya ilang
vim.keymap.set({ 'n', 'x' }, 'x', '"_x')

-- package manager
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print('Installing packer...')
	local packer_url = 'https://github.com/wbthomason/packer.nvim'
	vim.fn.system({ 'git', 'clone', '--depth', '1', packer_url, install_path })
	print('Done.')

	vim.cmd('packadd packer.nvim')

	install_plugins = true
end

-- using packer
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'    -- Package manager
	use {
		'nvim-tree/nvim-tree.lua',    -- nvim tree
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly'               -- optional, updated every week. (see issue #1193)
	}
	use {
		'numToStr/Comment.nvim', -- comment plugin
		config = function()
			require('Comment').setup()
		end
	}
	use 'lervag/vimtex'
	use 'andweeb/presence.nvim'
	use {
		'lucastavaresa/simpleIndentGuides.nvim',
		config = function()
			vim.opt.list = true -- enable in all buffers
			require("simpleIndentGuides").setup("┊")
		end
	}
	use {
		'glepnir/dashboard-nvim', -- dashboard
		config = function()
			require('dashboard').setup {
				theme = 'hyper',
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{
							desc = ' Update',
							group = '@property',
							action = 'PackerSync',
							key = 'u'
						},
						{
							desc = ' Files',
							group = 'Label',
							action = 'Telescope find_files',
							key = 'f',
						},
					},
				},
			}
		end,
		requires = { 'nvim-tree/nvim-web-devicons' },
		event = "VimEnter"
	}
	use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' } -- bars
	use { 'nvim-treesitter/nvim-treesitter' }                   -- treesitter
	use { 'onsails/lspkind.nvim' }
	use { 'rafamadriz/friendly-snippets' }                      -- friendly-snippets
	use { 'hrsh7th/nvim-cmp' }                                  --completion and his friends
	use {'p00f/clangd_extensions.nvim'}
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-nvim-lua' }
	use { 'hrsh7th/vim-vsnip' }
	use { 'hrsh7th/cmp-vsnip' }
	use {'hrsh7th/cmp-nvim-lsp-signature-help'}
	use "lukas-reineke/indent-blankline.nvim"
	use 'nathom/filetype.nvim'

	use {
		'xeluxee/competitest.nvim',
		requires = 'MunifTanjim/nui.nvim',
		config = function() require 'competitest'.setup() end
	}

	use { -- lsp and mason
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}

	use 'simrat39/symbols-outline.nvim' -- symbols outline
	use { 'nyoom-engineering/oxocarbon.nvim' }

	use {
		"windwp/nvim-autopairs", -- autopairs
		config = function() require("nvim-autopairs").setup {} end
	}

	use 'voldikss/vim-floaterm' -- terminal float

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',                       -- telescope
		requires = { 'nvim-lua/plenary.nvim' } -- telescope dependencies
	}

	use { 'nvim-lualine/lualine.nvim', -- lualine
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup({
				options = {
					theme = 'horizon'
				}
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

-- vimtex setup skim
vim.g.vimtex_view_method = 'skim'

-- some plugins setup
require("competitest").setup()
require("symbols-outline").setup({
	keymaps = {
		-- These keymaps can be a string or a table for multiple keys
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
		fold = "h",
		unfold = "l",
		fold_all = "W",
		unfold_all = "E",
		fold_reset = "R",
	},
})
require('Comment').setup({
	toggler = {
		line = '<leader>/',
	},
	opleader = {
		---Line-comment keymap
		line = '<leader>/',
	},
})

-- keyboard shortcuts for plugins
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>p', '\'dP')
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle <cr>')
vim.keymap.set('n', '<leader>s', ':SymbolsOutline <cr>')

-- floaterm
vim.keymap.set('n', '<leader>lg', ':FloatermNew --disposable --width=0.9 --height=0.7 --name=newterm lazygit<cr>')
vim.keymap.set('t', '<c-x>', '<C-\\><C-n>:FloatermHide gitwindow<cr>')
vim.keymap.set('n', '<c-x>', ':FloatermToggle newterm<cr>')
vim.keymap.set('t', '<c-x>', '<C-\\><C-n>:FloatermToggle newterm<cr>')
vim.keymap.set('n', '<c-p>', ':FloatermNew --disposable --name=calculator python3.10<cr>')
vim.keymap.set('t', '<c-p>', '<C-\\><C-n>:FloatermToggle calculator<cr>')

-- competitest
vim.keymap.set('n', '<c-t>', ':CompetiTestAdd <cr>')
vim.keymap.set('n', '<c-r>', ':CompetiTestRun <cr>')
vim.keymap.set('n', '<c-e>', ':CompetiTestEdit <cr>')
vim.opt.background = "dark"
vim.cmd("colorscheme oxocarbon")

-- find it in lua/plugins
require("plugins.barbar")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.nvim-tree")
require("plugins.filetype")
