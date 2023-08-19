Map("n", "gJ", "j0d^kgJ") -- Join current line with the next line with no space in between, *also* discarding any leading whitespace of the next line. Because gJ would include indentation. Stupidly.

Map("", "<leader>do", 'ddm' .. THROWAWAY_MARK .. 'ggP`' .. THROWAWAY_MARK) -- Move line to the top
Map("", "<leader>db", 'ddm' .. THROWAWAY_MARK .. 'Gp`' .. THROWAWAY_MARK) -- Bottom

Map("v", "J", function()
	for i = 1, vim.v.count1 do
		FeedKeys("J")
	end
end)

local function remove_highlighting__escape()
	Remove_highlighting()
	FeedKeysInt("<Esc>")
end
Map("n", "<Esc>", remove_highlighting__escape)

-- search related features
-- function Search_for_selection(search_operator)
--     FeedKeys('y')
--     vim.schedule(function()
--         local escaped_selection = EscapeForLiteralSearch(vim.fn.getreg('"'))
--         FeedKeys(search_operator .. '\\V' .. escaped_selection)
--         FeedKeysInt('<cr>')
--     end)
-- end
-- Map("v", "*", "<cmd>lua Search_for_selection('/')<cr>")
-- Map("v", "#", "<cmd>lua Search_for_selection('?')<cr>")

-- function Literal_search(searchOperator)
--     local escaped_text = EscapeForLiteralSearch(vim.fn.input("Type in your literal search: "))
--     if escaped_text == '' then
--         return
--     end
--     FeedKeys(searchOperator .. '\\V' .. escaped_text)
--     FeedKeysInt("<cr>")
-- end
-- Map("", "/", "<cmd>lua Literal_search('/')<cr>")
-- Map("", "?", "<cmd>lua Literal_search('?')<cr>")

function Search_for_register(search_operator)
    local char = GetChar("Input register key to search for:")
    if not char then return end
    local register = Validate_register(char)
    local escaped_register = EscapeForLiteralSearch(vim.fn.getreg(register))
    FeedKeys(search_operator .. '\\V' .. escaped_register)
    FeedKeysInt('<cr>')
end
Map("", "<leader>f", "<cmd>lua Search_for_register('/')<cr>")
Map("", "<leader>F", "<cmd>lua Search_for_register('?')<cr>")

-- -- function Search_for_char(search_operator)
-- --     local char = GetChar("Input char key to search for:")
-- --     if not char then return end
-- --     local escaped_char = EscapeForLiteralSearch(char)
-- --     FeedKeys("m" .. THROWAWAY_MARK .. search_operator .. '\\V' .. escaped_char)
-- --     FeedKeysInt('<cr>')
-- -- end
-- -- Map("", "<leader>s", "<cmd>lua Search_for_char('/')<cr>")
-- -- Map("", "<leader>S", "<cmd>lua Search_for_char('?')<cr>")

-- function Search_for_newlines(search_operator)
--     local newlines = vim.v.count1 + 1
--     local newlines_str = string.rep("\\n", newlines)
--     FeedKeys(search_operator .. newlines_str)
--     FeedKeysInt('<cr>')
-- end
-- Map("", "<leader>a", function() Search_for_newlines('/') end)
-- Map("", "<leader>A", function() Search_for_newlines('?') end)

-- function Search_for_current_word(direction)
--     FeedKeys('yiw')
--     vim.schedule(function()
--         local escaped_word = vim.fn.getreg('"')
--         FeedKeys(direction .. '\\v<' .. escaped_word .. ">")
--         FeedKeysInt('<cr>')
--     end)
-- end
-- Map("n", "*", function() Search_for_current_word('/') end)
-- Map("n", "#", function() Search_for_current_word('?') end)
