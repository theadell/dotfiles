return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.surround').setup()
    require('mini.ai').setup()
    require("mini.comment").setup()
    require("mini.pairs").setup()
  end,
}
