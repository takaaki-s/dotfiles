-- ~/.config/nvim-kickstart/lua/custom/keymaps.lua

-- =====================================================================
-- [[ 汎用カスタムキーマップ設定 ]]
-- =====================================================================

-- 1. インサートモード (i) からノーマルモードに戻る
vim.keymap.set('i', 'jj', '<Esc>', { silent = true, desc = 'Exit insert mode' })
vim.keymap.set('i', 'jk', '<Esc>', { silent = true, desc = 'Exit insert mode' })

-- 2. ターミナルモード (t) からノーマルモードに戻る
vim.keymap.set('t', 'jj', [[<C-\><C-n>]], { silent = true, desc = 'Exit terminal mode' })
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { silent = true, desc = 'Exit terminal mode' })

-- =====================================================================
-- 3. スマート検索設定（ターミナルにいたら自動で上に逃げてからTelescopeを開く）
-- =====================================================================
local function smart_search(builtin_name, search_opts)
  return function()
    local status_ok, builtin = pcall(require, 'telescope.builtin')
    if not status_ok then return end

    -- もし現在のバッファが「ターミナル」なら、上のウィンドウに移動してから実行
    if vim.bo.buftype == 'terminal' then
      vim.cmd('wincmd k') -- 上のウィンドウ（エディタ）に移動
      vim.schedule(function()
        builtin[builtin_name](search_opts) -- オプションを渡して実行
      end)
    else
      -- 普通のエディタ画面なら、通常通りその場で実行
      builtin[builtin_name](search_opts)
    end
  end
end

-- Kickstartの標準検索を、このスマート版で上書きします
vim.keymap.set('n', '<leader>sf', smart_search('find_files'), { silent = true, desc = 'Search Files (Smart)' })
vim.keymap.set('n', '<leader>sg', smart_search('live_grep'), { silent = true, desc = 'Search Grep (Smart)' })
vim.keymap.set('n', '<leader>s.', smart_search('oldfiles'), { silent = true, desc = 'Search Recent (Smart)' })
vim.keymap.set('n', '<leader><leader>', smart_search('buffers'), { silent = true, desc = 'Find Buffers (Smart)' })

-- 【今回追加】SPC s n : Neovimの設定ファイル検索（設定ディレクトリに限定するオプション付き）
vim.keymap.set('n', '<leader>sn', smart_search('find_files', { cwd = vim.fn.stdpath 'config' }), { silent = true, desc = 'Search Neovim files (Smart)' })

