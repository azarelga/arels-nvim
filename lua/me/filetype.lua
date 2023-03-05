require("filetype").setup({
    overrides = {
        extensions = {
            -- Set the filetype of *.pn files to potion
            pn = "potion",
        },
        literal = {
            -- Set the filetype of files named "MyBackupFile" to lua
            MyBackupFile = "lua",
        },
        complex = {
            -- Set the filetype of any full filename matching the regex to gitconfig
            [".*git/config"] = "gitconfig", -- Included in the plugin
        },

        -- The same as the ones above except the keys map to functions
        function_extensions = {
            ["cpp"] = function()
                vim.bo.filetype = "cpp"
								vim.keymap.set('n','<c-c>',':FloatermNew --autoclose=0 g++ -std=c++11 % -o %< && ./%< <cr>')
            end,
						["c"] = function()
							vim.bo.filetype = "c"
							vim.keymap.set('n','<c-c>',':FloatermNew --autoclose=0 gcc % -o %< && ./%< <cr>')
						end,
        },
        function_literal = {
            Brewfile = function()
                vim.cmd("syntax off")
            end,
        },
        function_complex = {
            ["*.math_notes/%w+"] = function()
                vim.cmd("iabbrev $ $$")
            end,
        },

        shebang = {
            dash = "sh",
        },
    },
})
