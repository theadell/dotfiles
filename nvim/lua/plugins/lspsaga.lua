return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
      	  symbol_in_winbar = {
	      	  -- enable = false,
          }
    })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    }
}
