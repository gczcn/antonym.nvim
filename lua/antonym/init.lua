local cmd = 'AntonymWord'
local M = {}
M.dictionary = {}

M.del_dictionary = function(del)
	for _, t in ipairs(del) do
		if M.dictionary[t[1]] then
			M.dictionary[t[1]] = nil
			if t[2] then
				if M.dictionary[t[2]] then
					M.dictionary[t[2]] = nil
				end
			end
		end
	end
end

M.add_dictionary = function(antonyms)
	for _, t in ipairs(antonyms) do
		M.dictionary[t[1]] = t[2]
		if t['mode'] then
			if t['mode'] ~= 'single' then
				M.dictionary[t[2]] = t[1]
			end
		else
			M.dictionary[t[2]] = t[1]
		end
	end
end

M.change_dictionary = function(antonyms)
	for _, t in ipairs(antonyms) do
		if t['del'] then
			M.del_dictionary({ t })
		else
			M.add_dictionary({ t })
		end
	end
end

M.replace_word = function(rep)
	vim.cmd('normal! ciw' .. rep)
end

local cword = function()
	return vim.fn.expand('<cword>')
end

M.replace = function()
	if M.dictionary[cword()] then
		M.replace_word(M.dictionary[cword()])
	else
		vim.notify(
			string.format(
				[[No antonyms found for the word '%s'. Add words with ':lua require('antonym').add_dictionary({{'word1', 'word2'}})']],
				cword()
			),
			vim.log.levels.ERROR
		)
	end
end

M.setup = function(opts)
	M.add_dictionary({
		{ 'acquire', 'release' },
		{ 'add', 'remove' },
		{ 'advance', 'retreat' },
		{ 'allocate', 'deallocate' },
		{ 'allow', 'deny' },
		{ 'assemble', 'disassemble' },
		{ 'assign', 'deassign' },
		{ 'associate', 'dissociate' },
		{ 'attach', 'detach' },
		{ 'begin', 'end' },
		{ 'bind', 'unbind' },
		{ 'commit', 'rollback' },
		{ 'compile', 'decompile' },
		{ 'compose', 'parse' },
		{ 'compress', 'decompress' },
		{ 'connect', 'disconnect' },
		{ 'construct', 'destruct' },
		{ 'create', 'destroy' },
		{ 'do', 'undo' },
		{ 'enable', 'disable' },
		{ 'encode', 'decode' },
		{ 'encrypt', 'decrypt' },
		{ 'enqueue', 'dequeue' },
		{ 'enter', 'leave' },
		{ 'expand', 'collapse' },
		{ 'first', 'last' },
		{ 'freeze', 'unfreeze' },
		{ 'front', 'back' },
		{ 'get', 'set' },
		{ 'grant', 'revoke' },
		{ 'head', 'tail' },
		{ 'high', 'low' },
		{ 'import', 'export' },
		{ 'include', 'exclude' },
		{ 'increase', 'decrease' },
		{ 'increment', 'decrement' },
		{ 'indent', 'dedent' },
		{ 'inflate', 'deflate' },
		{ 'inject', 'eject' },
		{ 'input', 'output' },
		{ 'insert', 'delete' },
		{ 'install', 'uninstall' },
		{ 'left', 'right' },
		{ 'Left', 'Right' },
		{ 'link', 'unlink' },
		{ 'load', 'unload' },
		{ 'lock', 'unlock' },
		{ 'maximum', 'minimum' },
		{ 'new', 'old' },
		{ 'next', 'previous' },
		{ 'open', 'close' },
		{ 'off', 'on' },
		{ 'paste', 'cut' },
		{ 'push', 'pop' },
		{ 'read', 'write' },
		{ 'reference', 'dereference' },
		{ 'register', 'deregister' },
		{ 'resume', 'suspend' },
		{ 'select', 'deselect' },
		{ 'send', 'receive' },
		{ 'serialize', 'deserialize' },
		{ 'set', 'unset' },
		{ 'show', 'hide' },
		{ 'start', 'stop' },
		{ 'true', 'false' },
		{ 'True', 'False' },
		{ 'TRUE', 'FALSE' },
		{ '1', '0' },
		{ 'yes', 'no' },
		{ 'Yes', 'No' },
		{ 'YES', 'NO' },
		{ 'up', 'down' },
		{ 'Up', 'Down' },
		{ 'upper', 'lower' },
	})
	if opts then
		if opts['antonyms'] then
			M.change_dictionary(opts['antonyms'])
		end
		-- if opts['del'] then
		--   M.del_dictionary(opts['del'])
		-- end
		if opts['key'] then
			vim.keymap.set('n', opts['key'], '<cmd>AntonymWord<CR>')
		end
	end

	vim.api.nvim_create_user_command(cmd, M.replace, {})
end

return M
