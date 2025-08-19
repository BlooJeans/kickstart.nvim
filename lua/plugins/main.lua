return {
  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  -- LSP Plugins

  -- { 'JoosepAlviste/nvim-ts-context-commentstring', desc = 'Context aware commenting (e.g. JSX commenting vs javascript)' },

  -- {
  --   'onsails/lspkind.nvim',
  --   opts = function(_, opts)
  --     -- use codicons preset
  --     opts.preset = 'codicons'
  --     -- set some missing symbol types
  --     opts.symbol_map = {
  --       Array = '',
  --       Boolean = '',
  --       Key = '',
  --       Namespace = '',
  --       Null = '',
  --       Number = '',
  --       Object = '',
  --       Package = '',
  --       String = '',
  --     }
  --   end,
  -- },

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.autopairs',
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}
