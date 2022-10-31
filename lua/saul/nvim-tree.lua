local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
    mappings = {
      list = {
           -- { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
           -- { key = "h", cb = tree_cb "close_node" },
           -- { key = "v", cb = tree_cb "vsplit" },
           -- 打开文件或文件夹
           { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
           -- 分屏打开文件
           { key = "v", action = "vsplit" },
           { key = "h", action = "split" },
           -- 文件操作
           { key = "<F5>", action = "refresh" },
           { key = "a", action = "create" },
           { key = "d", action = "remove" },
           { key = "r", action = "rename" },
           { key = "x", action = "cut" },
           { key = "c", action = "copy" },
           { key = "p", action = "paste" },
           { key = "s", action = "system_open" },
      },
    },
  },
  actions = {
      open_file = {
          -- 首次打开大小适配
          resize_window = true,
          -- 打开文件时关闭
          quit_on_open = true,
      },
  },
}
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
