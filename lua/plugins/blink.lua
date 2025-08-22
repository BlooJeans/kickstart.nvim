return {
  { -- Autocompletion
    'saghen/blink.cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = {},
      },

      'folke/lazydev.nvim',

      'fang2hou/blink-copilot',

      'xzbdmw/colorful-menu.nvim',

      'nvim-web-devicons',

      -- better completion menu styling
    },
    opts_extend = { 'sources.default', 'cmdline.sources', 'term.sources' },

    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default' (recommended) for mappings similar to built-in completions
        --   <c-y> to accept ([y]es) the completion.
        --    This will auto-import if your LSP supports it.
        --    This will expand snippets if the LSP sent a snippet.
        -- 'super-tab' for tab to accept
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- For an understanding of why the 'default' preset is recommended,
        -- you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        preset = 'super-tab',

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps

        ['<A-1>'] = {
          function(cmp)
            cmp.accept { index = 1 }
          end,
        },
        ['<A-2>'] = {
          function(cmp)
            cmp.accept { index = 2 }
          end,
        },
        ['<A-3>'] = {
          function(cmp)
            cmp.accept { index = 3 }
          end,
        },
        ['<A-4>'] = {
          function(cmp)
            cmp.accept { index = 4 }
          end,
        },
        ['<A-5>'] = {
          function(cmp)
            cmp.accept { index = 5 }
          end,
        },
        ['<A-6>'] = {
          function(cmp)
            cmp.accept { index = 6 }
          end,
        },
        ['<A-7>'] = {
          function(cmp)
            cmp.accept { index = 7 }
          end,
        },
        ['<A-8>'] = {
          function(cmp)
            cmp.accept { index = 8 }
          end,
        },
        ['<A-9>'] = {
          function(cmp)
            cmp.accept { index = 9 }
          end,
        },
        ['<A-0>'] = {
          function(cmp)
            cmp.accept { index = 10 }
          end,
        },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        ghost_text = {
          enabled = true,
          show_with_selection = true,
          show_without_selection = true,
          show_with_menu = true,
          show_without_menu = true,
        },

        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 50,
          treesitter_highlighting = true,
          window = {
            border = 'rounded',
            winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
          },
        },

        list = {
          selection = {
            preselect = false,
            auto_insert = true, -- <C-n> selects and applies the first
          },
        },

        menu = {
          -- auto_show = function(ctx) return ctx.mode ~= "cmdline" end,
          border = 'rounded',
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',

          -- if multi line completion, then prioritize the menu to the north to avoid the ghost text
          direction_priority = function()
            local ctx = require('blink.cmp').get_context()
            local item = require('blink.cmp').get_selected_item()
            if ctx == nil or item == nil then
              return { 's', 'n' }
            end

            local item_text = item.textEdit ~= nil and item.textEdit.newText or item.insertText or item.label
            local is_multi_line = item_text:find '\n' ~= nil

            -- after showing the menu upwards, we want to maintain that direction
            -- until we re-open the menu, so store the context id in a global variable
            if is_multi_line or vim.g.blink_cmp_upwards_ctx_id == ctx.id then
              vim.g.blink_cmp_upwards_ctx_id = ctx.id
              return { 'n', 's' }
            end
            return { 's', 'n' }
          end,

          draw = {

            treesitter = { 'lsp' },

            -- components = {
            --   kind_icon = {
            --     text = function(ctx)
            --       return get_kind_icon(ctx).text
            --     end,
            --     highlight = function(ctx)
            --       return get_kind_icon(ctx).highlight
            --     end,
            --   },
            -- },

            -- with colorful-menu:
            -- We don't need label_description now because label and label_description are already
            -- combined together in label by colorful-menu.nvim.
            -- columns = {
            --   { 'kind_icon' },
            --   { 'label', gap = 1 },
            -- },
            -- components = {
            --   label = {
            --     text = function(ctx)
            --       return require('colorful-menu').blink_components_text(ctx)
            --     end,
            --
            --     highlight = function(ctx)
            --       return require('colorful-menu').blink_components_highlight(ctx)
            --     end,
            --   },
            -- },

            columns = {
              { 'item_idx' },
              { 'kind_icon', gap = 1 },
              { 'label', gap = 1 },
              { 'label_description' }, -- shouldnt be necessary, since it should be included in the label coming from colorful-menu, but it also doesnt work manually, so leaving it here as a reminder and maybe one day it'll start working
              { 'source_name' }, -- e.g. LSP / Snippets
            },

            components = {
              item_idx = {
                text = function(ctx)
                  return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx)
                end,
                highlight = 'BlinkCmpItemIdx', -- optional, only if you want to change its color
              },
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                    local dev_icon, _ = require('nvim-web-devicons').get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require('lspkind').symbolic(ctx.kind, {
                      mode = 'symbol',
                    })
                  end

                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                    local dev_icon, dev_hl = require('nvim-web-devicons').get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
              label = {
                text = function(ctx)
                  return require('colorful-menu').blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require('colorful-menu').blink_components_highlight(ctx)
                end,
              },
              label_description = {
                width = { fill = true, max = 60 },
              },
            },
          },
        },
      },

      sources = {
        default = {
          'lsp',
          'copilot',
          -- 'path', -- just use <C-x><C-f>
          'snippets',
          'buffer',
        },
        per_filetype = {
          -- sql = {},
          lua = { inherit_defaults = true, 'lazydev' },
        },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            score_offset = 0,
            async = true,
          },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = {
        --implementation = 'lua'
        implementation = 'prefer_rust_with_warning',
        sorts = {
          'exact',
          -- defaults
          'score',
          'sort_text',
        },
      },

      -- Shows a signature help window while you type arguments for a function
      signature = {
        enabled = false,
        window = {
          border = 'rounded',
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
        },
      },
    },
  },
}
