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

  {
    'onsails/lspkind.nvim',
    opts = function(_, opts)
      -- if you change or add symbol here
      -- replace corresponding line in readme
      -- default = {
      --    Text = "󰉿",
      --    Method = "󰆧",
      --    Function = "󰊕",
      --    Constructor = "",
      --    Field = "󰜢",
      --    Variable = "󰀫",
      --    Class = "󰠱",
      --    Interface = "",
      --    Module = "",
      --    Property = "󰜢",
      --    Unit = "󰑭",
      --    Value = "󰎠",
      --    Enum = "",
      --    Keyword = "󰌋",
      --    Snippet = "",
      --    Color = "󰏘",
      --    File = "󰈙",
      --    Reference = "󰈇",
      --    Folder = "󰉋",
      --    EnumMember = "",
      --    Constant = "󰏿",
      --    Struct = "󰙅",
      --    Event = "",
      --    Operator = "󰆕",
      --    TypeParameter = "",
      --  },
      --  codicons = {
      --    Text = "",
      --    Method = "",
      --    Function = "",
      --    Constructor = "",
      --    Field = "",
      --    Variable = "",
      --    Class = "",
      --    Interface = "",
      --    Module = "",
      --    Property = "",
      --    Unit = "",
      --    Value = "",
      --    Enum = "",
      --    Keyword = "",
      --    Snippet = "",
      --    Color = "",
      --    File = "",
      --    Reference = "",
      --    Folder = "",
      --    EnumMember = "",
      --    Constant = "",
      --    Struct = "",
      --    Event = "",
      --    Operator = "",
      --    TypeParameter = "",
      --  },
      -- use codicons preset
      opts.preset = 'codicons'

      opts.symbol_map = {
        -- mix n matched between codicons and default
        -- defaults
        Text = '',
        Method = '󰆧',
        Function = '󰊕',
        Constructor = '',
        Field = '󰜢',
        Variable = '󰀫',
        Class = '󰠱',
        Interface = '',
        Module = '',
        Property = '󰜢',
        Unit = '󰑭',
        Value = '󰎠',
        Enum = '',
        Keyword = '󰌋',
        Snippet = '',
        Color = '󰏘',
        File = '󰈙',
        Reference = '󰈇',
        Folder = '󰉋',
        EnumMember = '',
        Constant = '󰏿',
        Struct = '󰙅',
        Event = '',
        Operator = '󰆕',
        kTypeParameter = '',

        -- missing
        Array = '',
        Boolean = '',
        Key = '',
        Namespace = '',
        Null = '',
        Number = '',
        Object = '',
        Package = '',
        String = '',
      }
    end,
  },

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
