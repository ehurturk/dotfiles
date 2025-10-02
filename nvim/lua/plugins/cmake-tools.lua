return {
  "Civitasv/cmake-tools.nvim",
  keys = {
    { "<leader>ckg", "<cmd>CMakeGenerate<cr>", desc = "Generate build system" },
    { "<leader>ckb", "<cmd>CMakeBuild<cr>", desc = "Build targets" },
    { "<leader>ckr", "<cmd>CMakeRun<cr>", desc = "Run selected target" },
    { "<leader>ckt", "<cmd>CMakeRunTest<cr>", desc = "Run tests with CTest" },
    { "<leader>ckbt", "<cmd>CMakeSelectBuildType<cr>", desc = "Select CMake build type" },
    { "<leader>ckbg", "<cmd>CmakeSelectBuildTarget<cr>", desc = "Select CMake build target" },
    { "<leader>cklt", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "Select CMake launch target" },
    { "<leader>ckc", "<cmd>CMakeClean<cr>", desc = "Clean all targets, intermediates and deps" },
  },
}
