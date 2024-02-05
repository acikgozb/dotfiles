vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- keep the paste register same after replacing a text
vim.keymap.set("x", "<Leader>p", '"_dP')

-- move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- always keep the cursor in middle while navigating the page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- always keep the cursor in middle while searching a text
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- when putting a copied text into a highlighted text, do not replace copy buffer with highlighted
vim.keymap.set("x", "<leader>p", '"_dP')

-- put yanked file in to systems registry, to use it in multiple places
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- do not use Q in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- vim settings
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 10

-- default tab indentation settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4

-- disable swap files completely
vim.opt.swapfile = false
