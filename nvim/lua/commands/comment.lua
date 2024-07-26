local M = {}

function get_comment_string()
	local file_ext = vim.fn.expand('%:e')
	local comment_strings = {
		bash = '# ',
		c = '// ',
		cpp = '// ',
		lua = '-- ',
		python = '# '
	}
	return comment_strings[file_ext]
end

function is_commented(start_line, end_line, comment_string)
	for line = start_line, end_line do
		local current_line = vim.fn.getline(line)
		if current_line:find("^" .. comment_string) then
			return true
		end
	end

	return false
end

function add_comment(start_line, end_line, comment_string)
	for line = start_line, end_line do
		local current_line = vim.fn.getline(line)
		vim.fn.setline(line, comment_string .. vim.fn.getline(line))
	end
end

function remove_comment(start_line, end_line, comment_string)
	for line = start_line, end_line do
		local current_line = vim.fn.getline(line)
		new_line = current_line:gsub("^" .. comment_string, "")
		vim.fn.setline(line, new_line)
	end
end

function M.comment_line()
	local comment_string = get_comment_string()
	if not comment_string then
		return
	end
	local line = vim.fn.line('.')
	local col = vim.fn.col('.')
	local current_line = vim.fn.getline(line)
	local before_cursor = current_line:sub(1, col - 1)
	local after_cursor = current_line:sub(col)

	if after_cursor:find("^" .. comment_string) then
		local new_after_cursor = after_cursor:gsub("^" .. comment_string, "")
		vim.fn.setline(line, before_cursor .. new_after_cursor)
	else
		vim.fn.setline(line, before_cursor .. comment_string .. after_cursor)
	end

	vim.cmd('redraw')
end

function M.comment_lines()
	local comment_string = get_comment_string()
	if not comment_string then
		return
	end

	local start_line, _ = vim.fn.line("'<")
	local end_line, _ = vim.fn.line("'>")

	if is_commented(start_line, end_line, comment_string) then
		remove_comment(start_line, end_line, comment_string)
	else
		add_comment(start_line, end_line, comment_string)
	end

	vim.cmd('redraw')
end

return M
