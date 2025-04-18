local M = {}

M.setup = function(capabilities)
  return {
    capabilities = capabilities,
    settings = {
      gopls = {
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        gofumpt = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  }
end

return M
