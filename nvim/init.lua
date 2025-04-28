local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("core/options")
require("core/keymaps")
require("plugins/config/autocmds")

require("lazy").setup("plugins")

require("luasnip.loaders.from_lua").lazy_load({
  paths = "~/.config/nvim/lua/snips/"
})
