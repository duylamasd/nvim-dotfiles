local dap_status, dap = pcall(require, "dap")
if not dap_status then
  vim.notify("nvim-dap is not installed.")
  return
end

local dap_ui_status, dap_ui = pcall(require, "dapui")
if not dap_ui_status then
  vim.notify("nvim-dap-ui is not installed.")
  return
end

local dap_vscode_status, dap_vs_code = pcall(require, "dap-vscode-js")
if not dap_vscode_status then
  vim.notify("dap-vscode-js is not installed.")
  return
end

dap_ui.setup()
dap_vs_code.setup({
  adapters = {
    'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost'
  }
})

dap.listeners.after.event_initialized["dapui_config"] =
    function() dap_ui.open() end

dap.listeners.before.event_terminated["dapui_config"] =
    function() dap_ui.close() end

dap.listeners.before.event_exited["dapui_config"] =
    function() dap_ui.close() end

local js_based_languages = {
  "javascript", "javascriptreact", "typescript", "typescriptreact"
}
for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}"
    }, {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require"dap.utils".pick_process,
      cwd = "${workspaceFolder}"
    }
  }
end

vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>B', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<leader>lp', function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)
