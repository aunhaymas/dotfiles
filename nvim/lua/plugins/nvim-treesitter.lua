return
  {
    --ORIGINAL Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "java",
        "javascript",
        "html",
        "lua",
        "luadoc",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enabled=true,
          lookahead=true,
          keymaps ={
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
          }
        }
      },
    },
  }
--INFO
--TSEditQuery highlights
