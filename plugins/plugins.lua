require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup()
        end
    }
    use "easymotion/vim-easymotion"
    use({
        'asvetliakov/vim-easymotion',
        as = 'vsc-easymotion',
        cond = function()
            return vim.g.vscode ~= nil
        end,
    })
end)
