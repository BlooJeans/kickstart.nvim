local M = {}
local terminals = {} ---@type LazyFloat[]

--- Opens an interactive floating terminal.
--- @param cmd? string
--- @param opts {width?: number, height?: number}
function M.float_term(cmd, opts)
  local termkey = vim.inspect { cmd = cmd or 'shell', count = vim.v.count1 }

  if terminals[termkey] and terminals[termkey]:buf_valid() then
    terminals[termkey]:toggle()
  else
    terminals[termkey] = require('lazy.util').float_term(cmd, {
      ft = 'lazyterm',
      size = {
        width = opts.width or 0.7,
        height = opts.height or 0.7,
      },
      persistent = true,
      border = 'rounded',
    })
    local buf = terminals[termkey].buf
    vim.b[buf].lazyterm_cmd = cmd

    vim.api.nvim_create_autocmd('BufEnter', {
      buffer = buf,
      callback = function()
        vim.cmd.startinsert()
      end,
    })
  end

  return terminals[termkey]
end

return M
