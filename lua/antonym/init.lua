local cmd = 'AntonymWord'
local M = {}
M.dictionary = {}

M.add_dictionary = function(antonyms)
  for _, t in ipairs(antonyms) do
    M.dictionary[t[1]] = t[2]
    M.dictionary[t[2]] = t[1]
  end
end

M.replace_word = function(rep)
	vim.cmd("normal! ciw" .. rep)
end

local cword = function()
	return vim.fn.expand("<cword>")
end

M.replace = function()
  if M.dictionary[cword()] then
    M.replace_word(M.dictionary[cword()])
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
    { 'set', 'up tear down' },
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
      M.add_dictionary(opts['antonyms'])
    end
    if opts['keys'] then
      vim.keymap.set('n', opts['keys'], '<cmd>AntonymWord<CR>')
    end
  end

  vim.api.nvim_create_user_command(cmd, M.replace, {})
end

return M
