-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Привязка клавиш для выхода в визуальный режим с использованием jj
vim.keymap.set("i", "jj", "<Esc>v", { noremap = true, silent = true })
