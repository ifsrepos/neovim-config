local M = {}

function M.comment_lines()
	local file_ext = vim.fn.expand('%:e')
	local comment_strings = {
		bash = '# ',
		c = '// ',
		cpp = '// ',
		lua = '-- ',
		python = '# '
	}

	local comment_string = comment_strings[file_ext]
	if not comment_string then
		return
	end

	local start_line, _ = vim.fn.line("'<")
	local end_line, _ = vim.fn.line("'>")

	for line = start_line, end_line do
		vim.fn.setline(line, comment_string .. vim.fn.getline(line))
	end

	vim.cmd('redraw')
end

return M
