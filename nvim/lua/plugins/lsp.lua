return {
  -- {
  --   "Hoffs/omnisharp-extended-lsp.nvim",
  --   name = "omnisharp-extended",
  --   event = "FileType",
  --   lazy = false,
  -- },
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "<leader>ld", "<cmd>Telescope diagnostics<cr>", desc = "List diagnotics" },
      { "<leader>lq", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Quickfix" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
      { "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", desc = "Rename" },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = {
        "gd",
        vim.lsp.buf.definition,
        desc = "Goto Definition",
      }
      keys[#keys + 1] = {
        "gr",
        vim.lsp.buf.references,
        desc = "References",
      }
      keys[#keys + 1] = {
        "gI",
        vim.lsp.buf.implementation,
        desc = "Goto Implementation",
        remap = true,
      }
      keys[#keys + 1] = {
        "gy",
        vim.lsp.buf.type_definition,
        desc = "Goto T(y)pe Definition",
        remap = true,
      }
      -- end
    end,

    dependencies = {},
    ---@class PluginLspOpts
    opts = {
      --   ---@type lspconfig.options
      -- setup = {
      --   csharp_ls = function(_, opts)
      --     opts.handlers = {
      --       ["textDocument/definition"] = function()
      --         return require("csharpls_extended").handler
      --       end,
      --     }
      --     opts.cmd = { "csharp-ls" }
      --     opts.filetypes = { "cs" }
      --     opts.init_options = { AutomaticWorkspaceInit = true }
      --     require("lspconfig").csharp_ls.setup(opts)
      --     return true
      --   end,
      -- },
      servers = {
        -- LSPs will be automatically installed with mason and loaded with lspconfig
        -- pylsp = {},
        pyright = {},
        gopls = {},
        jsonls = {},
        -- csharp_ls = {
        --   handlers = {
        --     ["textDocument/definition"] = require("csharpls_extended").handler,
        --   },
        -- },
        -- setup = {
        --   csharp_ls = function(_, opts)
        --     opts.handlers = {
        --       ["textDocument/definition"] = require("csharpls_extended").handler,
        --       ["textDocument/implementation"] = require("csharpls_extended").handler,
        --     }
        --     return true
        --   end,
        -- },
        omnisharp = {
          -- cmd = { "omnisharp-mono", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
          handlers = {
            ["textDocument/definition"] = require("omnisharp_extended").handler,
          },
          root_dir = function()
            return vim.loop.cwd()
          end,
          on_attach = function(client, bufnr)
            client.server_capabilities.semanticTokensProvider = {
              full = vim.empty_dict(),
              legend = {
                tokenModifiers = { "static_symbol" },
                tokenTypes = {
                  "comment",
                  "excluded_code",
                  "identifier",
                  "keyword",
                  "keyword_control",
                  "number",
                  "operator",
                  "operator_overloaded",
                  "preprocessor_keyword",
                  "string",
                  "whitespace",
                  "text",
                  "static_symbol",
                  "preprocessor_text",
                  "punctuation",
                  "string_verbatim",
                  "string_escape_character",
                  "class_name",
                  "delegate_name",
                  "enum_name",
                  "interface_name",
                  "module_name",
                  "struct_name",
                  "type_parameter_name",
                  "field_name",
                  "enum_member_name",
                  "constant_name",
                  "local_name",
                  "parameter_name",
                  "method_name",
                  "extension_method_name",
                  "property_name",
                  "event_name",
                  "namespace_name",
                  "label_name",
                  "xml_doc_comment_attribute_name",
                  "xml_doc_comment_attribute_quotes",
                  "xml_doc_comment_attribute_value",
                  "xml_doc_comment_cdata_section",
                  "xml_doc_comment_comment",
                  "xml_doc_comment_delimiter",
                  "xml_doc_comment_entity_reference",
                  "xml_doc_comment_name",
                  "xml_doc_comment_processing_instruction",
                  "xml_doc_comment_text",
                  "xml_literal_attribute_name",
                  "xml_literal_attribute_quotes",
                  "xml_literal_attribute_value",
                  "xml_literal_cdata_section",
                  "xml_literal_comment",
                  "xml_literal_delimiter",
                  "xml_literal_embedded_expression",
                  "xml_literal_entity_reference",
                  "xml_literal_name",
                  "xml_literal_processing_instruction",
                  "xml_literal_text",
                  "regex_comment",
                  "regex_character_class",
                  "regex_anchor",
                  "regex_quantifier",
                  "regex_grouping",
                  "regex_alternation",
                  "regex_text",
                  "regex_self_escaped_character",
                  "regex_other_escape",
                },
              },
              range = true,
            }
          end,
        },
        -- omnisharp_mono = {
        --   handlers = {
        --     ["textDocument/definition"] = require("omnisharp_extended").handler,
        --   },
        --   root_dir = function()
        --     return vim.loop.cwd()
        --   end,
        --   on_attach = function(client, bufnr)
        --     client.server_capabilities.semanticTokensProvider = {
        --       full = vim.empty_dict(),
        --       legend = {
        --         tokenModifiers = { "static_symbol" },
        --         tokenTypes = {
        --           "comment",
        --           "excluded_code",
        --           "identifier",
        --           "keyword",
        --           "keyword_control",
        --           "number",
        --           "operator",
        --           "operator_overloaded",
        --           "preprocessor_keyword",
        --           "string",
        --           "whitespace",
        --           "text",
        --           "static_symbol",
        --           "preprocessor_text",
        --           "punctuation",
        --           "string_verbatim",
        --           "string_escape_character",
        --           "class_name",
        --           "delegate_name",
        --           "enum_name",
        --           "interface_name",
        --           "module_name",
        --           "struct_name",
        --           "type_parameter_name",
        --           "field_name",
        --           "enum_member_name",
        --           "constant_name",
        --           "local_name",
        --           "parameter_name",
        --           "method_name",
        --           "extension_method_name",
        --           "property_name",
        --           "event_name",
        --           "namespace_name",
        --           "label_name",
        --           "xml_doc_comment_attribute_name",
        --           "xml_doc_comment_attribute_quotes",
        --           "xml_doc_comment_attribute_value",
        --           "xml_doc_comment_cdata_section",
        --           "xml_doc_comment_comment",
        --           "xml_doc_comment_delimiter",
        --           "xml_doc_comment_entity_reference",
        --           "xml_doc_comment_name",
        --           "xml_doc_comment_processing_instruction",
        --           "xml_doc_comment_text",
        --           "xml_literal_attribute_name",
        --           "xml_literal_attribute_quotes",
        --           "xml_literal_attribute_value",
        --           "xml_literal_cdata_section",
        --           "xml_literal_comment",
        --           "xml_literal_delimiter",
        --           "xml_literal_embedded_expression",
        --           "xml_literal_entity_reference",
        --           "xml_literal_name",
        --           "xml_literal_processing_instruction",
        --           "xml_literal_text",
        --           "regex_comment",
        --           "regex_character_class",
        --           "regex_anchor",
        --           "regex_quantifier",
        --           "regex_grouping",
        --           "regex_alternation",
        --           "regex_text",
        --           "regex_self_escaped_character",
        --           "regex_other_escape",
        --         },
        --       },
        --       range = true,
        --     }
        --   end,
        -- },
        -- sumneko_lua = {},
        dockerls = {},
        haxe_language_server = {
          initializationOptions = {
            displayArguments = { "build.hxml" },
          },
          settings = {
            haxe = {
              executable = "haxe",
            },
          },
        },
        lua_ls = {},
        rust_analyzer = {},
      },
      format = {
        formatting_options = {
          tabSize = 4,
          insertSpaces = true,
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    keys = { {
      "<leader>lt",
      "<cmd>TroubleToggle<cr>",
      desc = "Trouble",
    } },
    opts = { use_diagnostic_signs = true },
  },
  {
    "simrat39/symbols-outline.nvim",
    -- opts will be merged with the parent spec
    keys = { {
      "<leader>lv",
      "<cmd>SymbolsOutline<cr>",
      desc = "Symbol Outline",
    } },
    opts = {},
    cmd = "SymbolsOutline",
  },
}
