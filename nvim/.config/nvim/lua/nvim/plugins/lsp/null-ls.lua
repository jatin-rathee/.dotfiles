local status, null_ls = pcall(require, 'null-ls')
if not status then
  return
end

local formatting = null_ls.builtins.formatting

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup {
  sources = {
    formatting.eslint,
    formatting.stylua,
    formatting.prettier
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting  then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = 0,
        callback = function() vim.lsp.buf.formatting_sync() end
      })
    end
  end
}
