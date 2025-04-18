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
          "gopls",
        },
      })

      -- LSP setup
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Setup servers
      lspconfig.lua_ls.setup(require("plugins.lsp.servers.lua_ls").setup(capabilities))
      lspconfig.gopls.setup(require("plugins.lsp.servers.gopls").setup(capabilities))

      -- Setup common servers
      local common_config = require("plugins.lsp.servers.common").setup(capabilities)
      lspconfig.nginx_language_server.setup(common_config)
      lspconfig.dockerls.setup(common_config)
      lspconfig.bashls.setup(common_config)
      lspconfig.docker_compose_language_service.setup(common_config)
      lspconfig.clangd.setup(common_config)

      -- Setup keymaps
      require("plugins.lsp.keymaps").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}
