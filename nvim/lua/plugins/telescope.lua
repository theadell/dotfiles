return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files, {})
    local keymap = vim.keymap
    -- telescope
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")          -- find files within current working directory, respects .gitignore
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")           -- find string in current working directory as you type
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")         -- find string under cursor in current working directory
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")             -- list open buffers in current neovim instance
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")           -- list available help tags
    keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>")            -- list recently opened files

    keymap.set("n", "<leader>fa", function()                                -- search without ignoring git ignore
      builtin.find_files({ no_ignore = true, hidden = true })
    end)

    keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")         -- list all git commits (use <cr> to checkout) ["gc" for git commits]
    keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>")       -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
    keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")        -- list git branches (use <cr> to checkout) ["gb" for git branch]
    keymap.set("n", "<leader>gd", "<cmd>Telescope git_status<cr>")          -- list git status with diff view

    keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>")      -- List LSP references for word under cursor
    keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics<cr>")         -- List diagnostics
    keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>") -- list symbols in the current document
    keymap.set("n", "<leader>li", "<cmd>Telescope lsp_incoming_calls<cr>")  -- List LSP incoming calls for word under cursor
    keymap.set("n", "<leader>lo", "<cmd>Telescope lsp_outgoing_calls<cr>")  -- List LSP outgoing calls for word under cursor
    keymap.set("n", "<leader>ltd", "<cmd>Telescope lsp_type_definitions<cr>") -- Go to LSP type definition
    keymap.set("n", "<leader>lD", "<cmd>Telescope lsp_definitions<cr>")     -- Go to LSP impl
  end,
}
