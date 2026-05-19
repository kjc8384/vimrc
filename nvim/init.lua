-- =====================================================================
-- 1. 레거시 Vim 설정 불러오기 (기존 init.vim 내용 대체)
-- =====================================================================
-- 기존 ~/.vim 디렉토리를 런타임 경로에 추가
vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")
vim.opt.packpath = vim.opt.runtimepath:get()

-- 기존 ~/.vimrc를 소싱 (vim-plug 부분은 ~/.vimrc에서 삭제하셔야 합니다)
vim.cmd("source ~/.vimrc")

-- =====================================================================
-- 2. Neovim 전용 UI 설정 (기존 init.vim 내용)
-- =====================================================================
vim.opt.termguicolors = true

-- 투명 배경 설정 (highlight)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })

-- =====================================================================
-- 3. lazy.nvim 플러그인 매니저 설정
-- =====================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =====================================================================
-- 4. 플러그인 목록 및 설정
-- =====================================================================
require("lazy").setup({
  { import = "plugins" }, -- plugins.lua에서 플러그인 목록과 설정을 관리
  -- [1] 기존 플러그인 이전 (vim-plug에서 가져옴)
  { "adelarsq/vim-matchit" },
  { "liuchengxu/vista.vim" },
  { "easymotion/vim-easymotion" },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'material',
        icons_enabled = true,
      }
    },
    cond = function() return not vim.g.vscode end,
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        mode = "buffers", -- 탭 대신 버퍼 모드로 표시
        separator_style = "slant", -- 세련된 사선 스타일
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp", -- LSP 진단 정보 표시
      }
    },
    cond = function() return not vim.g.vscode end,
  },
  { "othree/html5.vim" },
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = true, -- 누가 이 줄을 수정했는지 옆에 흐릿하게 표시
      signcolumn = true,
    }
  },
  { "leafgarland/typescript-vim" },
  { "godlygeek/tabular" },
  { "tpope/vim-fugitive" },
  {
    'numToStr/Comment.nvim',
	dependencies = {
      -- 문맥에 맞는 주석 처리를 도와주는 플러그인
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    event = "VeryLazy",
  },
  { "editorconfig/editorconfig-vim" },
  { "HiPhish/rainbow-delimiters.nvim" },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = { mode = "cursor", max_lines = 3 }, -- 최대 3줄까지 상단 고정
    cond = function() return not vim.g.vscode end,
  },
  -- { "wellle/context.vim" },
  { "github/copilot.vim" },
  { "tpope/vim-characterize" },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
 })
