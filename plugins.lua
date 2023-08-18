require("packer").startup(function(use)
    if vim.g.vscode ~= nil then
        use "asvetliakov/vim-easymotion"
    else
        -- ordinary Neovim
        use "wbthomason/packer.nvim"
        use {
            "kylechui/nvim-surround",
            tag = "*",
            config = function()
                require("nvim-surround").setup()
            end
        }
        use "easymotion/vim-easymotion"
    end
    -- use({
    --     "asvetliakov/vim-easymotion",
    --     cond = function()
    --         return vim.g.vscode ~= nil
    --     end,
    -- })
end)
