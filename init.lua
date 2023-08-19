Map = vim.keymap.set
Cmd = vim.cmd
VSCodeNotify = vim.fn.VSCodeNotify
VSCodeCall = vim.fn.VSCodeCall

vim.g.mapleader = " "

THROWAWAY_REGISTER = 'o'
THROWAWAY_MARK = 'I'

require('config')
require('helpers')
require('packer')
require('plugins')

if vim.g.vscode then
	require('vscode')
end

print("hello aj")
