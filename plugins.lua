local overrides = require('custom.configs.overrides')

local plugins = {
  {
    "dreamsofcode-io/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function ()
      require('chatgpt').setup({
        async_api_key_cmd = "echo 'OPENAI_API_KEY'",
      })
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "mypy",
        "ruff",
        "pyright",
        "html-lsp",
        "prettier",
        "stylua",
        "json-lsp",
        "css-lsp",
        "eslint-lsp",
        "vue-language-server",
        "typescript-language-server"
      }
    }
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function ()
          require('copilot_cmp').setup()
        end
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot",  group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
      },
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function ()
        require('custom.configs.null-ls')
      end
    },
    config = function ()
      require("plugins.configs.lspconfig")
      require('custom.configs.lspconfig')
    end
  }
}

return plugins
