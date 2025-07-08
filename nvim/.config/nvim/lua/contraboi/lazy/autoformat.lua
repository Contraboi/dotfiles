-- somewhere in your init.lua (before you load the plugin):
vim.g.conform_format_on_save = true

-- add a toggle command or keymap:
vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
  vim.g.conform_format_on_save = not vim.g.conform_format_on_save
  print("conform.nvim format on save:",
    vim.g.conform_format_on_save and "enabled" or "disabled")
end, { desc = "Toggle conform.nvim format-on-save" })

-- in your plugin spec:
return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,

    -- check our global flag first:
    format_on_save = function(bufnr)
      if not vim.g.conform_format_on_save then
        -- simply skip formatting entirely
        return false
      end

      -- your existing logic:
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms   = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,

    formatters_by_ft = {
      lua             = { 'stylua' },
      typescript      = { { 'prettierd', 'prettier' } },
      typescriptreact = { { 'prettierd', 'prettier' } },
      javascript      = { { 'prettierd', 'prettier' } },
      javascriptreact = { { 'prettierd', 'prettier' } },
      ['*']           = { 'codespell' },
    },
  },
}
