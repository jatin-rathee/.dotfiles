local installer_status, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not installer_status then
  return
end

local lsp_signature_ok, lsp_signature = pcall(require, "lsp_signature")
if not lsp_signature_ok then
  return
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
local on_attach = function(client, bufnr)
  lsp_signature.on_attach({
    bind = true,
    floating_window = false,
    handler_opts = {
      border = 'single'
    }
  }, bufnr)

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities
  }

  if server.name == 'sumneko_lua' then
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  end

  server:setup(opts)
end)

-- local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
-- if not lspconfig_ok then
--   return
-- end

-- local lsp_signature_ok, lsp_signature = pcall(require, "lsp_signature")
-- if not lsp_signature_ok then
--   return
-- end

-- local on_attach = function(client, bufnr)
--   lsp_signature.on_attach({
--     bind = true,
--     floating_window = false,
--     handler_opts = {
--       border = 'single'
--     }
--   }, bufnr)

--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   local bufopts = { noremap = true, silent = true, buffer = bufnr }
--   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
-- end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()

-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

-- lspconfig.jsonls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

-- lspconfig.emmet_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

-- -- require('nvim.plugins.lsp.lspsaga')
