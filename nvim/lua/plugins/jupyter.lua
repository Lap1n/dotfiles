return {
  {
    "kiyoon/jupynium.nvim",
    -- build = "pip3 install --user .",
    build = "conda run --no-capture-output -n serving pip install .",
    lazy = false,
    -- python_host = { "conda", "run", "--no-capture-output", "-n", "serving", "python" },
    python_host = "/opt/homebrew/Caskroom/miniforge/base/envs/serving/bin/python3",
    jupyter_command = { "conda", "run", "--no-capture-output", "-n", "serving", "jupyter" },
    keys = { { "<S-CR>", "<cmd>JupyniumExecuteSelectedCells<CR>" } },
    auto_start_server = {
      enable = true,
      file_pattern = { "*.ju.*" },
    },
    auto_start_sync = {
      enable = true,
      file_pattern = { "*.ju.*", "*.md" },
    },
    branch = "master",
  },
}
