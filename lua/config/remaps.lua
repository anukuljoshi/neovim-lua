-- center cusror on screen when moving
Map("", "<C-d>", "<C-d>zz")
Map("", "<C-u>", "<C-u>zz")
Map({"n", "v"}, "n", "nzzzv")
Map({"n", "v"}, "N", "Nzzzv")

-- append next line to current line without moving the cursor
Map("n", "J", "mzJ`z")

-- gg moves cursor to start of first line
Map("", "gg", "gg0")
-- G moves cursor to end of last line
Map("", "G", "G$")

-- copy from cursor to end of line
Map("n", "Y", "y$")

-- requires clipboard set up for neovim see :help clipboard
-- install xclip | sudo apt install xclip
-- copy to system clipboard register
Map({"n", "v"}, "<leader>y", [["+y]])
Map({"n", "v"}, "<leader>Y", [["+Y]])
-- paste from system clipboard
Map({"n", "v"}, "<leader>p", [["+p]])
Map({"n", "v"}, "<leader>P", [["+P]])

-- delete to void register
Map({"n", "v"}, "<leader>d", "\"_d")
Map({"n", "v"}, "<leader>D", "\"_D")
-- delete to void register when pasting over a selection
Map("x", "<leader>p", [["_dP]])

-- map register n to <leader>n
Map("", "<leader>1", [["1]])
Map("", "<leader>2", [["2]])
Map("", "<leader>3", [["3]])
Map("", "<leader>4", [["4]])
Map("", "<leader>5", [["5]])

-- move line up down in visual mode
Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-1<CR>gv=gv")

-- remove highlighted text
Map("", "<leader>n", ":nohl<CR>")
