return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl", -- require("ibl")을 자동으로 호출하기 위한 설정
  event = { "BufReadPost", "BufNewFile" }, -- 파일을 열 때 로드 (지연 로딩)
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require "ibl.hooks"

    -- 컬러스크림이 변경될 때마다 하이라이트 그룹을 다시 정의
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    -- IBL 설정 실행
    require("ibl").setup {
      indent = {
        highlight = highlight,
      },
      scope = {
        enabled = true, -- 현재 스코프 강조 여부
        show_start = false,
        show_end = false,
      },
    }
  end,
}
