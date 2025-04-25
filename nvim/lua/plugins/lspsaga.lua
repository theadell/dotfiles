return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      symbol_in_winbar = { enable = true },
      outline = { enable = true },
      lightbulb = {
        enable = true,
        sign = false,
        virtual_text = true,
      },
      beacon = { enable = false },
    })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  }
}
