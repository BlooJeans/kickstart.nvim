return {
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      user_default_options = {
        names = true,
        names_opts = {
          lowercase = true,
          camelcase = false,
          uppercase = false,
        },
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        tailwind = true,
        tailwind_opts = {
          update_names = true, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
        },
        virtualtext_inline = true,
      },
    },
  },
}
