local langs_no_auto_format = { "java" }

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({

      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        go = { "goimports", "gofmt" },
        java = { lsp_format = "perfer" },
        xml = { "xmlformatter" }
      },


      format_on_save = function(bufnr)
        if vim.tbl_contains(langs_no_auto_format, vim.bo[bufnr].filetype) then
          return false
        end
        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end,
    })

    vim.keymap.set({ "n", "v" }, "<leader>gF", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
