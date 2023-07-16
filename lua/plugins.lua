vim.g.mapleader = require("lazy").setup({
	{ "romgrk/fzy-lua-native" },

	{ "lewis6991/gitsigns.nvim" },

	{
		"nvim-treesitter/nvim-treesitter",
		--build = ":TSUpdate"
	},

	-- UI
	{ "gelguy/wilder.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "fgheng/winbar.nvim" },
	{ "nvim-lualine/lualine.nvim" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	{ "ryanoasis/vim-devicons" }, -- Optional for Wilder

    -- Intergration
	{
		"Civitasv/cmake-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- QOL
	--{ 'karb94/neoscroll.nvim' }, -- Smooth Scrolling

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},

	-- CMP
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "onsails/lspkind.nvim" }, -- Icons

	-- DAP
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },

	-- Formatter
	{ "mhartington/formatter.nvim" },

	-- Debugging
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Utilities
	{ "dstein64/vim-startuptime" },

	-- Colorschemes
	{ "AlphaTechnolog/pywal.nvim", as = "pywal" },
})
