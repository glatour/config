return {
  {
    'andrew-george/telescope-themes',
    config = function()
      require('telescope').load_extension 'themes'
    end,
  },
  {
    'nvchad/ui',
    config = function()
      require 'nvchad'
    end,
  },
  {
    'nvchad/base46',
    lazy = true,
    build = function()
      require('base46').load_all_highlights()
    end,
  },
  { 'nvzone/volt' },
}
