vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v")        -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")        -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")        -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>")    -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     --  go to previous tab

-- file explorer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


vim.keymap.set('t', '<leader><Esc>', [[<C-\><C-N>]], { desc = "Exit Terminal mode" })

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-terminal-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})

vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()                     -- Create a new vertical split window
  vim.cmd("term")                    -- Open a terminal in the new window
  vim.cmd("wincmd J")                -- Move the terminal window to the bottom
  vim.api.nvim_win_set_height(0, 10) -- Set the height of the terminal window to 5 lines
end, { desc = "Open a terminal split at the bottom" })
