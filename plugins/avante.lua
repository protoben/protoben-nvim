-- vim: ts=2 sw=2 expandtab

local exists, secrets = pcall(require, 'secrets.ollama')

-- Load plugin only if secrets are found
if exists then
  return {
    {
      "yetone/avante.nvim",
      lazy = true,
      event = "VeryLazy",
      version = false, -- Never set this value to "*"! Never!
      init = function()
        require('which-key').add({
          {
            '<leader>a',
            group = 'Avante',
          },
          {
            '<leader>aC',
            function()
              require('avante').get():clear_history()
            end,
            mode = 'n',
            desc = 'avante: clear history',
          },
        })
      end,
      opts = {
        provider = "ollama_openai",
        auto_suggestions_provider = "ollama_openai",
        cursor_applying_provider = "ollama_openai",
        memory_summary_provider = "ollama_openai",
        behaviour = {
          auto_focus_sidebar = false,
          enable_cursor_planning_mode = true,
          windows = { position = "smart" },
        },
        mappings = { submit = { insert = '<C-CR>' } },
        hints = { enabled = false },
        vendors = {
          ollama_openai = {
            __inherited_from = 'openai',
            api_key = secrets.ollama_api_key,
            endpoint = secrets.ollama_url .. '/v1/',
            model = secrets.llm_model,
            max_completion_tokens = 32768,
          },
        },
    ---
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
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            mode = 'legacy',
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
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
