
local M = {}

function M.unfold_below_cursor()
	local ts_utils = require'nvim-treesitter.ts_utils'
	local current_node = ts_utils.get_node_at_cursor()
	if not current_node then return end

	local start_line, _, end_line, _ = current_node:range()

	vim.cmd(start_line+1 .. "," .. end_line+1 .. "foldopen!")
end

return M
