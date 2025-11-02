return {
	{
		'andrew-george/telescope-themes',

		config = function()
			require('telescope').load_extension 'themes'
		end,
	},
	{
		'thesimonho/kanagawa-paper.nvim',
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		'rebelot/kanagawa.nvim',
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- Default options:
			require('kanagawa').setup {
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = true, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = {
						wave = {},
						lotus = {},
						dragon = {},
						all = {
							ui = {
								-- bg_gutter = 'none',
							},
						},
					},
				},
				overrides = function(colors) -- add/modify highlights
					local theme = colors.theme
					return {
						NormalFloat = { bg = 'none' },
						FloatBorder = { bg = 'none' },
						FloatTitle = { bg = 'none' },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },

						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
					}
				end,
				theme = 'wave', -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = 'wave', -- try "dragon" !
					light = 'lotus',
				},
			}

			-- setup must be called before loading
			vim.cmd 'colorscheme kanagawa'
		end,
	},
	{
		'ellisonleao/gruvbox.nvim',
		priority = 1000,
		config = true,
		opts = {},
		setup = function()
			-- Default options:
			require('gruvbox').setup {
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = '', -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = true,
				transparent_mode = true,
			}
			vim.cmd 'colorscheme gruvbox'
		end,
	},
	{
		'webhooked/kanso.nvim',
		lazy = false,
		priority = 1000,
	},
	{
		'miikanissi/modus-themes.nvim',
		priority = 1000,
		setup = function()
			require('modus-themes').setup {
				style = 'auto',
				variant = 'default', -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
				transparent = false, -- Transparent background (as supported by the terminal)
				dim_inactive = true, -- "non-current" windows are dimmed
				hide_inactive_statusline = false, -- Hide statuslines on inactive windows. Works with the standard **StatusLine**, **LuaLine** and **mini.statusline**
				line_nr_column_background = true, -- Distinct background colors in line number column. `false` will disable background color and fallback to Normal background
				sign_column_background = true, -- Distinct background colors in sign column. `false` will disable background color and fallback to Normal background
				styles = {},
				--- You can override specific color groups to use other groups or a hex color
				--- Function will be called with a ColorScheme table
				--- Refer to `extras/lua/modus_operandi.lua` or `extras/lua/modus_vivendi.lua` for the ColorScheme table
				---@param colors ColorScheme
				on_colors = function(colors) end,

				--- You can override specific highlights to use other groups or a hex color
				--- Function will be called with a Highlights and ColorScheme table
				--- Refer to `extras/lua/modus_operandi.lua` or `extras/lua/modus_vivendi.lua` for the Highlights and ColorScheme table
				---@param highlights Highlights
				---@param colors ColorScheme
				on_highlights = function(highlights, colors) end,
			}
		end,
	},
	{
		'neanias/everforest-nvim',
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require('everforest').setup {
				-- Your config here
				dim_inactive_windows = true,
			}
		end,
	},
	-- {
	--   'nvchad/ui',
	--   config = function()
	--     require 'nvchad'
	--   end,
	-- },
	-- {
	--   'nvchad/base46',
	--   lazy = true,
	--   build = function()
	--     require('base46').load_all_highlights()
	--   end,
	-- },
	-- { 'nvzone/volt' },
}
