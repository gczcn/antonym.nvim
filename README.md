# Antonym.nvim
> A simple neovim plug-in for replacing the word under the cursor with its antonym.

![Example usage](Video.gif)

[Chinese README](https://github.com/gczcn/antonym.nvim/blob/main/README.zh_CN.md)

## Installing
#### Lua
###### With [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
return {
  'gczcn/antonym.nvim',
  cmd = 'AntonymWord',
  config = function()
    require('antonym').setup({})
  end
}
```

###### With [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use {
  'gczcn/antonym.nvim',
  cmd = 'AntonymWord',
  config = function()
    require('antonym').setup({})
  end
}
```

#### Vimscript
###### With [vim-plug](https://github.com/junegunn/vim-plug)
```vim
call plug#begin()
  " ...
  Plug 'gczcn/antonym.nvim'
  " ...
call plug#end()

lua << EOF
  require('antonym').setup({})
EOF
```

## Usage
The plug-in provides a command `AntonymWord`, through which you can replace the word under the cursor with the matching word in the replacement list.

There is no default mapping for this plugin, you can set it using `vim.keymap.set`:
```lua
vim.keymap.set('n', '<leader>wa', '<cmd>AntonymWord<CR>') -- Change '<leader>wa' to your key
```

Or, if you don't use lazy loading, you can do this (not recommended):
```lua
require('antonym').setup({
  key = '<leader>wa' -- Change '<leader>wa' to your key
})
```

## Lists
<!-- #### Default replacement list: -->
<details><summary>Default replacement list:</summary>

|word a|word b|
|-|-|
|acquire|release|
|add|remove|
|advance|retreat|
|allocate|deallocate|
|allow|deny|
|assemble|disassemble|
|assign|deassign|
|associate|dissociate|
|attach|detach|
|begin|end|
|bind|unbind|
|commit|rollback|
|compile|decompile|
|compose|parse|
|compress|decompress|
|connect|disconnect|
|construct|destruct|
|create|destroy|
|do|undo|
|enable|disable|
|encode|decode|
|encrypt|decrypt|
|enqueue|dequeue|
|enter|leave|
|expand|collapse|
|first|last|
|freeze|unfreeze|
|front|back|
|get|set|
|grant|revoke|
|head|tail|
|high|low|
|import|export|
|include|exclude|
|increase|decrease|
|increment|decrement|
|indent|dedent|
|inflate|deflate|
|inject|eject|
|input|output|
|insert|delete|
|install|uninstall|
|left|right|
|Left|Right|
|link|unlink|
|load|unload|
|lock|unlock|
|maximum|minimum|
|new|old|
|next|previous|
|open|close|
|off|on|
|paste|cut|
|push|pop|
|read|write|
|reference|dereference|
|register|deregister|
|resume|suspend|
|select|deselect|
|send|receive|
|serialize|deserialize|
|set|unset|
|set|up tear down|
|show|hide|
|start|stop|
|true|false|
|True|False|
|TRUE|FALSE|
|1|0|
|yes|no|
|Yes|No|
|YES|NO|
|up|down|
|Up|Down|
|upper|lower|

</details>

If you want to view the value corresponding to a certain word, you can use:
```lua
require('antonym').dictionary['word'] -- 'word' is the word you want to find.
```

If you need to add a group of words, you can do this:

The following is an example of adding the correspondence between 'a' and 'b':
```lua
require('antonym').add_dictionary({{'a', 'b'}})
```

## Configuration
The plugin has the following settings available:
```lua
require('antonym').setup({
  antonyms = {
    -- Add or override matches here.
    -- For example:
    { 'worda', 'wordb' }
  },
  -- When the plug-in is loaded, this item is used to set a shortcut key for replacing the word.
  -- This method is not recommended!
  key = '<leader>wa' -- Change '<leader>wa' to your key.
})
```
