-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection

function Search_char_bidirectional()
    hop.hint_char1() 
end
Map("", "s", Search_char_bidirectional)

function Search_char2_bidirectional()
    hop.hint_char2()
end
Map("", "<leader>s", Search_char2_bidirectional)

function Search_words_forward()
    hop.hint_words({ direction = directions.AFTER_CURSOR }) 
end
Map("", "<leader>w", Search_words_forward)

function Search_words_backward()
    hop.hint_words({ direction = directions.BEFORE_CURSOR }) 
end
Map("", "<leader>b", Search_words_backward)

function Search_char_inline()
    hop.hint_char1({ current_line_only = true })
end
Map("", "<leader>f", Search_char_inline)

function Search_word_inline()
    hop.hint_words({ current_line_only = true })
end
Map("", "<leader>fw", Search_word_inline)

function Search_patterns()
    hop.hint_patterns()
end
Map("", "<leader>/", Search_patterns)

function Jump_vertical_forward()
    hop.hint_vertical({ direction = directions.AFTER_CURSOR })
end
Map("", "<leader>j", Jump_vertical_forward)

function Jump_vertical_backward()
    hop.hint_vertical({ direction = directions.BEFORE_CURSOR })
end
Map("", "<leader>k", Jump_vertical_backward)

function Jump_lines()
    hop.hint_vertical()
end
Map("", "<leader>g", Jump_lines)
