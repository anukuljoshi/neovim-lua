Map = vim.keymap.set
Cmd = vim.cmd
VSCodeNotify = vim.fn.VSCodeNotify
VSCodeCall = vim.fn.VSCodeCall

vim.g.mapleader = " "

THROWAWAY_REGISTER = 'o'
THROWAWAY_MARK = 'I'

require('options')
require('functions')
require('plugins')
require('keymap-plugins')
require('remaps')
require('features')
require('big')

if vim.g.vscode then
	require('vscode-functions')
	require('vscode-mappings')
else
	require('nvim')
end

print("nvim loaded")