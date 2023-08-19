-- center cusror on screen when moving
Map("", "<C-d>", "<C-d>zz")
Map("", "<C-u>", "<C-u>zz")
Map({"n", "v"}, "n", "nzzzv")
Map({"n", "v"}, "N", "Nzzzv")

Map("o", "{", "v{")
Map("o", "}", "v}")
Map("o", "+", "v+")
Map("o", "-", "v-")

-- add new line above cursor
Map("n", "<c-k>", "o<esc>")
-- add new line below cursor
Map("n", "<c-j>", "o<esc>")
-- copy from cursor to end of line
Map("n", "Y", "y$")

-- requires clipboard set up for neovim see :help clipboard
-- install xclip | sudo apt install xclip
-- copy to system clipboard register
Map({"n", "v"}, "<leader>y", [["+y]])
Map({"n", "v"}, "<leader>Y", [["+Y]])
-- paster from system clipboard
Map({"n", "v"}, "<leader>p", [["+p]])
Map({"n", "v"}, "<leader>P", [["+P]])

-- delete to void register
Map({"n", "v"}, "<leader>d", "\"_d")
Map({"n", "v"}, "<leader>D", "\"_D")
-- delete to void register when pasting over a selection
Map("x", "<leader>p", [["_dP]])

-- move line up down in visual mode
Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-1<CR>gv=gv")

-- remove highlighted text
Map("", "<leader>n", ":nohl<CR>")
