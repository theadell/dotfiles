local M = {}

M.setup = function()
  -- Mason setup
  require("mason").setup()

  -- Mason LSP config setup
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",
      "bashls",
      "jsonls",
      "clangd",
      "html",
      "yamlls",
      "terraformls",
      "taplo",
      "dockerls",
      "docker_compose_language_service",
      "gopls",
    },
  })

  -- LSP setup
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- Setup servers
  lspconfig.lua_ls.setup(require("lsp.servers.lua_ls").setup(capabilities))
  lspconfig.gopls.setup(require("lsp.servers.gopls").setup(capabilities))

  -- Setup common servers
  local common_config = require("lsp.servers.common").setup(capabilities)
  lspconfig.nginx_language_server.setup(common_config)
  lspconfig.dockerls.setup(common_config)
  lspconfig.bashls.setup(common_config)
  lspconfig.docker_compose_language_service.setup(common_config)
  lspconfig.clangd.setup(common_config)

  -- Setup keymaps
  require("lsp.keymaps").setup()
end

return M
