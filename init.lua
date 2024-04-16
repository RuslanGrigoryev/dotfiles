local map = vim.api.nvim_set_keymap

-- Mappings
map('n', '<Space>', '', {})

vim.g.mapleader = ' '

options = { noremap = true }

map('n', '<leader>s', ':update<cr>', options)
map('n', '<leader>w', ':w<cr>', options)

vim.cmd [[
  au BufReadPost *.atd set syntax=ocaml
]]

vim.g.neoformat_enabled_ocaml = {'ocamlformat --enable-outside-detected-project'}

vim.api.nvim_exec([[
  augroup AutoFormat
    autocmd!
    autocmd BufWritePre *.ml :Neoformat ocamlformat
  augroup END
]], false)

require("core/mappings")
require("core/plugins")
require("core/options")
require("core/plugin_configs")
require'lspconfig'.ocamllsp.setup{}

