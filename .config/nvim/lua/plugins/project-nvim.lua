return {
    "ahmedkhalf/project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("project_nvim").setup {
            detection_methods = { "pattern", "lsp" },
            patterns = { ".git", "Makefile", "package.json" },
        }
        require("telescope").load_extension("projects") -- Enable `:Telescope projects`
    end,
}
