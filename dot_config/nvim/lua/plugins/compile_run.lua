local compileRun = function()
	vim.cmd("w")
	-- check file type
	local ft = vim.bo.filetype

	if ft == "markdown" then
		vim.cmd(":MarkdownPreviewToggle")
	elseif ft == "c" then
		vim.cmd(":set splitbelow")
		vim.cmd(":sp")
		vim.cmd(":res -5")
		vim.cmd(":term gcc % -o %< && time ./%<")
	elseif ft == "cpp" then
		vim.cmd(":set splitbelow")
		vim.cmd(':exec "!g++ -std=c++11 % -Wall -o %<"')
		vim.cmd(":sp")
		vim.cmd("res -7")
		vim.cmd(":term ./%<")
	elseif ft == "python" then
		vim.cmd(":set splitbelow")
		vim.cmd(":sp")
		vim.cmd(":term python3 %")
	elseif ft == "sh" then
		vim.cmd(":!time bash %")
	end
end

vim.keymap.set('n', 'r', compileRun, { silent = true })
