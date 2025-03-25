return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Icons for file types
        cmd = "NvimTreeToggle", -- Lazy load when command is used
        keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" } }, -- Keybind
        config = function()
            require("nvim-tree").setup({
                view = { width = 30, side = "left" }, -- Sidebar width
                renderer = { icons = { show = { git = true, folder = true, file = true } } }, -- Show icons
                actions = { open_file = { quit_on_open = true } }, -- Close tree after opening a file
            })
        end,
    },
}

