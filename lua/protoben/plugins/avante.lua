-- vim: ts=2 sw=2 expandtab

local exists, secrets = pcall(require, 'secrets.ollama')

-- Load plugin only if secrets are found
if exists then
  local llm_model = "qwen3:30b-a3b-q4_K_M"
  --local llm_model = "deepseek-coder-v2:16b-lite-instruct-q6_K"
  local embedding_model = "nomic-embed-text:latest"
  local ollama_url = "http://10.9.8.156:11434"
  return {
    {
      "yetone/avante.nvim",
      lazy = true,
      event = "VeryLazy",
      version = false, -- Never set this value to "*"! Never!
      opts = {
        provider = "ollama",
        auto_suggestions_provider = nil,
        cursor_applying_provider = nil,
        memory_summary_provider = "ollama",
        behaviour = {
          auto_focus_sidebar = true,
          enable_cursor_planning_mode = true, -- enable cursor planning mode!
          windows = {
            position = "smart"
          }
        },
        ollama = {
          endpoint = ollama_url,
          model = llm_model,
        },
      },
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      build = "make",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "echasnovski/mini.pick", -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        --"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    }
  }
else
  return { }
end
