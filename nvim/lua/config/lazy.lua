local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec={
    {import = "plugins"}
  }


})
vim.notify("¡Se inicializó Lazy")


--pin	boolean?	When true, this plugin will not be included in updates
--event	string? or string[] or fun(self:LazyPlugin, event:string[]):string[] or {event:string[]|string, pattern?:string[]|string}	Lazy-load on event. Events can be specified as BufEnter or with a pattern like BufEnter *.lua
--cmd	string? or string[] or fun(self:LazyPlugin, cmd:string[]):string[]	Lazy-load on command
