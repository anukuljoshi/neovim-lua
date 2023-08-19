Map = vim.keymap.set
Cmd = vim.cmd
VSCodeNotify = vim.fn.VSCodeNotify
VSCodeCall = vim.fn.VSCodeCall

vim.g.mapleader = " "

THROWAWAY_REGISTER = 'o'
THROWAWAY_MARK = 'I'

require('config.options')
require('helpers.functions')
require('plugins.plugins')
require('plugins.mappings')
require('config.remaps')
require('helpers.features')

if vim.g.vscode then
	require('vscode.functions')
	require('vscode.mappings')
end

print("nvim loaded")