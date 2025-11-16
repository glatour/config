return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = 'v0.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'mono',
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      -- optionally disable cmdline completions
      -- cmdline = {},
    },
    --
    -- snippets = {
    --   preset = 'luasnip',
    -- },
    --
    -- fuzzy = {
    --   use_frecency = true,
    --   use_proximity = true,
    --
    --   fuzzy = { implementation = 'prefer_rust_with_warning' },
    -- },
    fuzzy = { implementation = 'prefer_rust_with_warning' },

    -- experimental signature help support
    signature = { enabled = true },
  },
}
