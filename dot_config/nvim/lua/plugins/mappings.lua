-- custom keybinding
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        t = {
          -- ターミナルモード (t) で jj を押すと <C-\><C-n> (ノーマルモードに戻る) を実行
          ["jj"] = { "<C-\\><C-n>", desc = "Exit terminal mode to normal mode" },
        },
      },
    },
  },
}
