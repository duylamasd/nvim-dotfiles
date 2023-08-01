local status, startup = pcall(require, "startup")

if not status then
  vim.notify("Couldn't load startup-nvim.")
  return
end

startup.setup({theme = "evil"})
