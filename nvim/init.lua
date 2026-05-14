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
  -- [1] 기존 플러그인 이전 (vim-plug에서 가져옴)
  { "adelarsq/vim-matchit" },
  { "neoclide/coc.nvim", branch = "release" },
  { "liuchengxu/vista.vim" },
  { "easymotion/vim-easymotion" },
  { "vim-airline/vim-airline" },
  { "vim-airline/vim-airline-themes" },
  { "othree/html5.vim" },
  { "airblade/vim-gitgutter" },
  { "leafgarland/typescript-vim" },
  { "godlygeek/tabular" },
  { "tpope/vim-fugitive" },
  { "preservim/nerdcommenter" },
  { "editorconfig/editorconfig-vim" },
  { "luochen1990/rainbow" },
  { "nathanaelkane/vim-indent-guides" },
  { "wellle/context.vim" },
  { "github/copilot.vim" },
  { "tpope/vim-characterize" },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
 })
