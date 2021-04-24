local M = {}

local lspconfig = require "lspconfig"
local callbacks = require "lsp_ext/callbacks"
local util = require "lsp_ext/util"
local putil = require "lsp_ext/private/util"

M.on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    -- if client.resolved_capabilities.document_formatting then
    -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    -- elseif client.resolved_capabilities.document_range_formatting then
    -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    -- end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            false
        )
    end
end

function M.set_signature_help_autocmd(wait)
    wait = wait or 100
    vim.lsp.callbacks["textDocument/signatureHelp"] = callbacks.signature_help
    vim.api.nvim_command("augroup nvim_lsp_signature_help")
    vim.api.nvim_command("autocmd!")
    vim.api.nvim_command(
        string.format(
            "autocmd CursorMoved,CursorMovedI,VimResized,BufHidden,BufLeave * lua require'configs.lsp.utils'._on_cursor_moved_for_signature_help(%s)",
            wait
        )
    )
    vim.api.nvim_command("augroup END")
end
function M._on_cursor_moved_for_signature_help(wait)
    vim.validate {wait = {wait, "n"}}

    local function should_call_signature_help()
        local chars =
            vim.tbl_flatten(
            vim.tbl_map(
                function(cap)
                    return cap.resolved_capabilities.signature_help_trigger_characters
                end,
                util.buf_resolved_capabilities()
            )
        )
        if vim.tbl_contains(chars, putil.get_before_char_skip_white()) then
            return true
        end
        return false
    end

    if not should_call_signature_help() then
        return
    end

    if M.signature_help_debounce_timer ~= nil then
        if vim.loop.is_active(M.signature_help_debounce_timer) then
            putil.clear_timeout(M.signature_help_debounce_timer)
        end
        M.signature_help_debounce_timer = nil
    end
    M.signature_help_debounce_timer =
        putil.set_timeout(wait, vim.schedule_wrap(require("lspsaga.signaturehelp").signature_help))
end

-- M.set_signature_help_autocmd(100)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.util.default_config =
    vim.tbl_extend(
    "force",
    lspconfig.util.default_config,
    {
        capabilities = capabilities,
        on_attach = M.on_attach,
        init_options = {
            usePlaceholders = true
        }
    }
)
return M
