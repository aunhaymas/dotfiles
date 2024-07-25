--Como lo estoy ordenando por archivos, cada uno debe devolver una tabla
return
  {
    --"ellisonleao/gruvbox.nvim",
    "folke/tokyonight.nvim",
    lazy=false,
    priority = 100000,
    config = function()--this is gruvbox.setup{}
      --vim.cmd([[colorscheme gruvbox]])
      vim.cmd([[colorscheme tokyonight]])
    end,
  }

