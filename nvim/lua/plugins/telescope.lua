return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable previous <leader> mappings
    { "<leader>/", false },
    { "<leader><space>", false },
    -- change keymaps to use 'f' as the prefix instead of <leader>
    { "ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    {
      "fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
  },
}
