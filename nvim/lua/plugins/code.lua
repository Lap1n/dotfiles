return {
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    cmd = "HopWord",
    keys = {
      { "<leader>w", "<cmd>HopWord<cr>", desc = "Hop Word" },
      -- { "S", "<cmd>HopPattern<cr>", desc = "Hop Pattern" },
      -- { "f", "<cmd>HopChar1<cr>", desc = "Hop Char 1" },
      -- { "F", "<cmd>HopChar2<cr>", desc = "Hop Char 2" },
      -- { "t", "<cmd>HopLine<cr>", desc = "Hop Line" },
    },
    opts = {},
  },
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-path",
      {
        "zbirenbaum/copilot-cmp",

        config = function()
          vim.defer_fn(function()
            require("copilot_cmp").setup()
          end, 100)
        end,
        dependencies = {
          "zbirenbaum/copilot.lua",
          opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
          },
          config = function()
            vim.defer_fn(function()
              require("copilot").setup()
            end, 100)
          end,
        },
      },
    },
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" }, { name = "copilot" } }))

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-space>"] = cmp.mapping.complete({}),
        ["<C-e>"] = cmp.mapping.complete({}),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,

    -- ---@param opts cmp.ConfigSchema
    -- opts = function(_, opts)
    --   -- local has_words_before = function()
    --   --   unpack = unpack or table.unpack
    --   --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --   --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    --   -- end
    --
    --   local luasnip = require("luasnip")
    --   local cmp = require("cmp")
    --
    --   local select_opts = { behavior = cmp.SelectBehavior.Select }
    --   local has_words_before = function()
    --     if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    --       return false
    --     end
    --     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --     return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
    --   end
    --
    --   opts.sources =
    --     cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" }, { name = "copilot", group_index = 2 } }))
    --
    --   opts.mapping = vim.tbl_extend("force", opts.mapping, {
    --     -- ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
    --     -- ["<Down>"] = cmp.mapping.select_next_item(select_opts),
    --     --
    --     ["<C-k>"] = cmp.mapping.select_prev_item(select_opts),
    --     ["<C-j>"] = cmp.mapping.select_next_item(select_opts),
    --     ["<C-space>"] = cmp.mapping.complete({}),
    --     ["<C-e>"] = cmp.mapping.complete({}),
    --
    --     -- ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
    --     -- ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
    --     --
    --     -- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    --     -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
    --     --
    --     -- ["<C-e>"] = cmp.mapping.abort(),
    --     -- ["<CR>"] = cmp.mapping.confirm({ select = false }),
    --     --
    --     -- ["<C-d>"] = cmp.mapping(function(fallback)
    --     --   if luasnip.jumpable(1) then
    --     --     luasnip.jump(1)
    --     --   else
    --     --     fallback()
    --     --   end
    --     -- end, { "i", "s" }),
    --     --
    --     -- ["<C-b>"] = cmp.mapping(function(fallback)
    --     --   if luasnip.jumpable(-1) then
    --     --     luasnip.jump(-1)
    --     --   else
    --     --     fallback()
    --     --   end
    --     -- end, { "i", "s" }),
    --     ["<Tab>"] = cmp.mapping(function(fallback)
    --       if cmp.visible() and has_words_before() then
    --         cmp.select_next_item()
    --       elseif luasnip.expand_or_jumpable() then
    --         luasnip.expand_or_jump()
    --       else
    --         fallback()
    --       end
    --     end, { "i", "s" }),
    --     ["<S-Tab>"] = cmp.mapping(function(fallback)
    --       if cmp.visible() then
    --         cmp.select_prev_item()
    --       elseif luasnip.jumpable(-1) then
    --         luasnip.jump(-1)
    --       else
    --         fallback()
    --       end
    --     end, { "i", "s" }),
    --   })
    -- end,
  },
  {
    "nvim-telescope/telescope.nvim",
    -- keys = {
    --   -- add a keymap to browse plugin files
    --   -- stylua: ignore
    --   {
    --     "<leader>fp",
    --     function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
    --     desc = "Find Plugin File",
    --   },
    -- },
    -- change some options
    -- opts = {
    --   defaults = {
    --     layout_strategy = "horizontal",
    --     layout_config = { prompt_position = "top" },
    --     sorting_strategy = "ascending",
    --     winblend = 0,
    --   },
    -- },

    keys = function(_, keys)
      return {
        { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Search files" },
        { "<leader>ss", "<cmd>Telescope find_files<cr>", desc = "Search files" },
        { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Search text" },
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search current buffer" },
        { "<leader>sh", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
        { "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "Switch buffers" },
      }
    end,

    opts = function()
      --require("plugins.dressing")
      local telescope = require("telescope")
      --telescope.load_extension("fzf")
      ---telescope.load_extension("frecency")
      --telescope.load_extension("projects")

      local actions = require("telescope.actions")
      return {
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
        extensions = {
          -- Your extension configuration goes here:
          -- extension_name = {
          --   extension_config_key = value,
          -- }
          -- please take a look at the readme of the extension you want to configure
          telescope_frequency = {},
        },
      }
    end,
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "yaml",
      },
    },
  },
}
