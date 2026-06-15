-- ~/.config/nvim-kickstart/lua/custom/terminal.lua

-- 状態を保持するための変数
local term_buf = nil
local term_win = nil
local restore_cmd = ""

-- 1. F7: ターミナルのスマート開閉・フォーカス移動
local function toggle_terminal()
  local current_win = vim.api.nvim_get_current_win()

  -- すでにターミナルウィンドウが開いていて、有効な場合
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    if current_win == term_win then
      -- 自分がターミナルの中にいるなら、ウィンドウを閉じる
      vim.api.nvim_win_close(term_win, true)
      term_win = nil
    else
      -- エディタ側など別の場所にいるなら、ターミナルにフォーカスを移動する
      vim.api.nvim_set_current_win(term_win)
      vim.cmd('startinsert') -- すぐに入力できるようインサートモードへ
    end
  else
    -- ターミナルがまだ開いていない場合は、新しく開く
    vim.cmd('botright 15split')
    term_win = vim.api.nvim_get_current_win()
    
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
      vim.api.nvim_win_set_buf(term_win, term_buf)
    else
      vim.cmd('terminal')
      term_buf = vim.api.nvim_get_current_buf()
    end
    vim.cmd('startinsert')
  end
end

-- キーマップ登録
vim.keymap.set('n', '<F7>', toggle_terminal, { desc = 'Terminal: Toggle / Focus' })
vim.keymap.set('t', '<F7>', toggle_terminal, { desc = 'Terminal: Toggle / Focus' })


-- 2. F8: ターミナルの最大化 / 元に戻す (トグル)
local function toggle_maximize()
  if vim.bo.buftype ~= 'terminal' then
    return
  end

  if restore_cmd ~= "" then
    vim.cmd(restore_cmd)
    restore_cmd = ""
  else
    restore_cmd = vim.fn.winrestcmd()
    vim.cmd('wincmd _')
    vim.cmd('wincmd |')
  end
end

vim.keymap.set('n', '<F8>', toggle_maximize, { silent = true, desc = 'Terminal: Maximize Toggle' })
vim.keymap.set('t', '<F8>', toggle_maximize, { silent = true, desc = 'Terminal: Maximize Toggle' })

-- 3. ターミナルの見た目設定 ＆ ターミナル内限定の検索ハック（タイミング問題修正版）
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-terminal-style', { clear = true }),
  callback = function()
    -- 見た目をすっきりさせる
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'

    -- ターミナルバッファ内（ノーマルモード）限定のキーマップ
    local opts = { buffer = true, silent = true }
    
    -- SPC s f : ファイルサーチ
    vim.keymap.set('n', '<leader>sf', function()
      vim.cmd('wincmd k') -- まず上のウィンドウに移動
      vim.schedule(function()
        require('telescope.builtin').find_files() -- 移動が完了した後に実行
      end)
    end, opts)
    
    -- SPC s g : ファイル内文字列検索 (Grep)
    vim.keymap.set('n', '<leader>sg', function()
      vim.cmd('wincmd k')
      vim.schedule(function()
        require('telescope.builtin').live_grep()
      end)
    end, opts)
    
    -- SPC s . : 最近開いたファイル (Recent Files)
    vim.keymap.set('n', '<leader>s.', function()
      vim.cmd('wincmd k')
      vim.schedule(function()
        require('telescope.builtin').oldfiles()
      end)
    end, opts)
    
    -- SPC SPC : 開いているバッファ一覧
    vim.keymap.set('n', '<leader><leader>', function()
      vim.cmd('wincmd k')
      vim.schedule(function()
        require('telescope.builtin').buffers()
      end)
    end, opts)
  end,
})
