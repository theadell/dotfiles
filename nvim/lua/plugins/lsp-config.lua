return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
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
          "cmake",
          "gopls",
          "sqls",
        },
      })

      -- LSP setup
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Setup servers
      lspconfig.lua_ls.setup(require("plugins.lsp.servers.lua_ls").setup(capabilities))
      lspconfig.gopls.setup(require("plugins.lsp.servers.gopls").setup(capabilities))
      lspconfig.yamlls.setup(require("plugins.lsp.servers.yamlls").setup(capabilities))
      lspconfig.cmake.setup(require("plugins.lsp.servers.cmake").setup(capabilities))

      -- Setup common servers
      local common_config = require("plugins.lsp.servers.common").setup(capabilities)
      lspconfig.nginx_language_server.setup(common_config)
      lspconfig.dockerls.setup(common_config)
      lspconfig.bashls.setup(common_config)
      lspconfig.sqls.setup(common_config)
      lspconfig.docker_compose_language_service.setup(common_config)
      lspconfig.clangd.setup(common_config)

      -- Setup keymaps
      require("plugins.lsp.keymaps").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
  },
}
