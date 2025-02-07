-- auto-create missing dirs when saving a file
--vim.api.nvim_create_autocmd("BufWritePre", {
--	pattern = "*",
--	callback = function()
--	local dir = vim.fn.expand("<afile>:p:h")
--	if vim.fn.isdirectory(dir) == 0 then
--		vim.fn.mkdir(dir, "p")
--	end
--end,
--})

-- spellcheck in md
vim.api.nvim_create_autocmd("FileType", 
{
	pattern = "markdown",
	command = "setlocal spell wrap",
})

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", 
{
	pattern = "*",
	callback = function()
	vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- reload files on external change
--vim.api.nvim_create_autocmd("FocusGained", 
--{
--	pattern = "*",
--	command = "checktime",
--})

-- restore cursor pos on file open
vim.api.nvim_create_autocmd("BufReadPost", 
{
	pattern = "*",
	callback = function()
	local line = vim.fn.line("'\"")
	if line > 1 and line <= vim.fn.line("$") then
		vim.cmd("normal! g'\"")
	end
end,
})
