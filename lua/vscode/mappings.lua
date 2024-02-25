Map("n", "gD", Reveal_definition_aside)
Map("n", "gt", Go_to_implementation)
Map("n", "gq", Go_to_reference)
Map("n", "<<", Outdent)
Map("n", ">>", Indent)
Map("n", "=s", Convert_to_spaces)
Map("n", "=t", Convert_to_tabs)
Map("n", "=is", Indent_with_spaces)
Map("n", "=it", Indent_with_tabs)
Map("n", "<leader>wi", CloseEditor)
Map("n", "<leader>wu", UndoCloseEditor)
Map("n", "<leader>wo", CloseOtherEditors)
Map("n", "zk", Git_stage_file)
Map("n", "zK", Git_unstage_file)
Map({ "n", "v" }, "zj", Git_stage_change)
Map({ "n", "v" }, "zJ", Git_revert_change)
Map("n", "zi", Git_open_changes)
Map("n", "zI", Git_open_all_changes)
Map("n", "zo", Accept_merge_both)
Map("n", "zO", Accept_merge_all_both)
Map("n", "zu", Accept_merge_current)
Map("n", "zU", Accept_merge_all_current)
Map("n", "zp", Accept_merge_incoming)
Map("n", "zP", Accept_merge_all_incoming)
Map({ "n", "v" }, "zl", Accept_merge_selection)
Map("v", "<", Outdent_vis)
Map("v", ">", Indent_vis)
Map("v", "<S-Tab>", Outdent_vis)
Map("v", "<Tab>", Indent_vis)
Map("n", "<C-/>", Comment)
Map("v", "<C-/>", Comment_vis)
Map("n", "gcc", Comment)
Map("v", "gc", Comment_vis)

-- use tabs to switch between editors
Map("n", "<Tab>", Open_next_editor)
Map("n", "<S-Tab>", Open_previous_editor)

-- navigate between different editors
Map("n", "<C-j>", Navigate_down)
Map("n", "<C-k>", Navigate_up)
Map("n", "<C-h>", Navigate_left)
Map("n", "<C-l>", Navigate_right)
