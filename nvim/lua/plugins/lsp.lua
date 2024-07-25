return{
  "neovim/nvim-lspconfig",
  dependencies={
    "williamboman/mason.nvim",--lazy will recognize this as installed and run it first
    "folke/neodev.nvim",--for lua
  },
  config = function()
    local on_attach = function(_, bufnr)--cuando se conecte a un buffer.lua settea estos keybinds
      local function buf_set_option(...)
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        vim.api.nvim_buf_set_option(bufnr, ...)
      end
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
      -- Mappings.
      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      -- vim.keymap.set('n', '<space>wl', function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      --end, :xopts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>E', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    end
    require("neodev").setup()
    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          telemetry = { enable = false },
          workspace = {checkThirdParty = false},
        }
      }
    })
    require("lspconfig").clangd.setup({})
  end
}
