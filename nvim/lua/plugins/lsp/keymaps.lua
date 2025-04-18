local M = {}

M.setup = function()
  local keymap = vim.keymap
  local opts = { noremap = true, silent = true } -- Keeping standard opts
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", { desc = "Show definition, references" })
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to declaration" })
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" })
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code actions" })
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Smart rename" })
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show line diagnostics" })
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Show cursor diagnostics" })
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Jump to previous diagnostic" })
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Jump to next diagnostic" })
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Show documentation" })
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { desc = "Toggle outline" })
end
return M

