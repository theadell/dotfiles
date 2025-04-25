local M = {}
M.setup = function(capabilities)
  return {
    capabilities = capabilities,
    filetypes = { "cmake", "make", "Makefile" },
  }
end
return M
