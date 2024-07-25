---@diagnostic disable: missing-fields
--requisitos para la config. necesito cmp luanip y autopairs
local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_autopairs = require "nvim-autopairs.completion.cmp"

--esto lo referencio en /lua/plugins/cmp.lua en main
--así que necesito devolver una tabla con un método setup
--
--Acá defino la tabla
local M = {}
--Acá defino el metodo setup
function M.setup()
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),--scroll docs
      ["<C-f>"] = cmp.mapping.scroll_docs(4), --scroll docs
      ["<C-e>"] = cmp.mapping.abort(),        --scroll cancel

      --Ctrl is more complex. i may have the cmp n other plugin open
      --at the same time
      ["<C-n>"] = cmp.mapping(function(fallback)
        --if Im using the cmp, then go to the next
        if cmp.visible()then
          cmp.select_next_item()
          --if Im at a luasnipp choice,it might collide with cmp
        elseif luasnip.choice_active() then
          luasnip.change_choice(1)
        else
          fallback()
        end
        --Only works on modes "i" and "s"
      end,{"i","s"}),
      ["<C-p>"] = cmp.mapping.select_prev_item(),

      --confirm the option I want
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,--when confirm,insert
        select = true,--select option
      },
      --Force open the autocomplete
      ["<C-space"] = cmp.mapping.complete(),
    },
    sources = {
      --Common sources for all buffers
      { name = "nvim_lsp" },
      { name = "path"},
      { name = "luasnip"},
      { name = "buffer"},
    }
  })
  --This is for the autopairs
  --autopairs will do its job when the confirmation is done
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = {tex = ""} })
  --Config for specific FILETYPE
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git'},

    }, {
        { name = 'buffer' },
      })
  })
  --Use buffer source for '/' and '?'
  cmp.setup.cmdline({'/','?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      --options will be on base of the text of the current file
      { name = 'buffer'} -- snippet when I searching something
    }
  })
  --Use cmdline & path source for ':'
  --autocomplete path and cmd commands
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path'}
    }, {
        { name = 'cmdline'}
      })
  })
end

return M
