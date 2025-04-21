local M = {}

function M.setup(capabilities)
  return {
    capabilities = vim.tbl_deep_extend("force", capabilities or {}, {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    }),
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        keyOrdering = false,
        format = { enable = true },
        validate = true,
        schemaStore = {
          enable = false,
          url = "", -- required workaround
        },
        schemas = require("schemastore").yaml.schemas(),
      },
    },
  }
end

return M
