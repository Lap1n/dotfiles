return {
  {
    "dccsillag/magma-nvim",
    lazy = false,
    keys = {
      { "<leader>mr", "<cmd>MagmaEvaluateVisual<cr>", mode = "v", desc = "Evaluate Operator" },
      { "<leader>mr", "<cmd>MagmaEvaluateOperator<cr>", desc = "Evaluate Operator" },
      { "<leader>mc", "<cmd>MagmaReevaluateCell<cr>", desc = "Reevaluate Cell" },
      { "<leader>mrr", "<cmd>MagmaEvaluateLine<cr>", desc = "Evaluate Line" },
      { "<leader>mi", "<cmd>MagmaInit python3<cr>", desc = "Init" },
      { "<leader>mo", "<cmd>MagmaShowOutput<cr>", desc = "Show Output" },
      { "<leader>md", "<cmd>MagmaDelete<cr>", desc = "Delete Output" },
    },
  },
}
-- nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
-- nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
-- xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
-- nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
-- nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
-- nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>
