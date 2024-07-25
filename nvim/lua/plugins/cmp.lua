return{
  "hrsh7th/nvim-cmp", --AutoComplete MOTOR
  --AutoComplete Sources
  dependencies = {
     "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-git",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "windwp/nvim-autopairs",
  },
  --
  event = "VeryLazy",--Cargar este plugin al final
  --modulo a cargar cuando se haga el setup
  main = 'config.plugins.cmp',
  config = true,
}
