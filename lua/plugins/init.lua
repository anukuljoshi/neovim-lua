function IsVSCodeInstance()
    return vim.g.vscode ~= nil
end

function IsNeoVimInstance()
    return vim.g.vscode == nil
end

require("packer").startup(function(use)
    -- maintains other plugins
    use "wbthomason/packer.nvim"

    -- todo (optional): add telescope

    -- add/update/delete surround characters
    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup()
        end
    }

    -- quick easy jump motions
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
end)

require("plugins.mappings")
