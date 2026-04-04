function disable_arrow_keys()
	local key_names = {"<Up>", "<Down>", "<Left>", "<Right>"}
	local modes = {"n", "v", "c", "t"}
	for i, key in ipairs(key_names) do
		for j, mode in ipairs(modes) do
			vim.keymap.set(mode, key, "<Nop>")
		end
	end
end

function open_file_in_buffer()
  local user_input = vim.fn.input("file name:")
  if user_input ~= "" then
    local cmd = "e " .. user_input
    vim.cmd(cmd)
  end
end

function save_no_quit()
  local cmd = "wa"
  vim.cmd(cmd)
  vim.print("saved!")
end

disable_arrow_keys()

vim.g.mapleader =" "
vim.keymap.set("n", "<Leader>r", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]])

vim.keymap.set("n", "<Leader>vl", ":vsplit<CR>")
vim.keymap.set("n", "<Leader>hl", ":split<CR>")
vim.keymap.set("n", "<Leader>bo", open_file_in_buffer)

vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "WW", save_no_quit)
