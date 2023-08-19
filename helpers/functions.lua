function FeedKeys(keys)
	vim.api.nvim_feedkeys(keys, "n", false)
end

function FeedKeysInt(keys)
	local feedable_keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
	vim.api.nvim_feedkeys(feedable_keys, "n", true)
end

function EscapeForLiteralSearch(input)
	input = string.gsub(input, '\\', '\\\\')
	input = string.gsub(input, '/', '\\/')
	return input
end

function EscapeFromLiteralSearch(input)
	if string.sub(input, 1, 2) ~= "\\V" then return input end
	input = string.sub(input, 3)
	input = string.gsub(input, '\\/', '/')
	input = string.gsub(input, '\\\\', '\\')
	return input
end

function EscapeFromRegexSearch(input)
	if string.sub(input, 1, 2) ~= '\\v' then return input end
	return string.sub(input, 3)
end

function GetChar(prompt)
	vim.api.nvim_echo({ { prompt, "Input" } }, true, {})
	local char = vim.fn.getcharstr()
	-- That's the escape character (<Esc>). Not sure how to specify it smarter
	-- In other words, if you pressed escape, we return nil
	if char == '' then
		char = nil
	end
	return char
end

function Validate_register(register)
	if register == 'q' then
		return '+'
	elseif register == 'w' then
		return '0'
	elseif register == "'" then
		return '"'
	else
		return register
	end
end

function GetBool(message)
	local char = GetChar(message .. " (f/d):")
	local bool
	if char == 'f' then
		bool = true
	elseif char == 'd' then
		bool = false
	else
		print("Press f for true, d for false")
		return nil
	end
	return bool
end

function Remove_highlighting() Cmd("noh") end

function Toggle_highlight_search() Cmd("set hlsearch!") end

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
