# Antonym.nvim
> 一个简单的 neovim 插件，用于将光标下的单词替换为其反义词。

![Example usage](Video.gif)

[English](README.md)

## 安装
#### Lua
###### 使用 [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
return {
  'gczcn/antonym.nvim',
  cmd = 'AntonymWord',
  config = function()
    require('antonym').setup({})
  end
}
```

###### 使用 [packer.nvim](https://github.com/wbthomason/packer.nvim)
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
###### 使用 [vim-plug](https://github.com/junegunn/vim-plug)
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

## 用法
这个插件提供了命令`AntonymWord`，该命令可以将光标下的单词替换为与之相匹配的单词。

该插件没有默认键盘映射，你可以使用`vim.keymap.set`设置映射：
```lua
vim.keymap.set('n', '<leader>wa', '<cmd>AntonymWord<CR>') -- 将'<leader>wa'改为你使用的按键。
```

或者，如果你不使用延迟加载，可以这么设置（不推荐）：
```lua
require('antonym').setup({
  key = '<leader>wa' -- 将'<leader>wa'改为你使用的按键。
})
```

## 列表
<details><summary>默认的替换列表：</summary>

|word_a|word_b|
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

如果你想查看某个单词对应的值，可以使用：
```lua
require('antonym').dictionary['word'] -- 'word' 是你要查找的单词。
```

如果你需要添加一组单词，可以这么做：  
下面是添加`a`和`b`对应关系的例子。
```lua
require('antonym').add_dictionary({{'a', 'b'}})
```
如果你只想添加单个单词，可以这么做：  
下面是一个仅将`true`改为`0`，而不变动`false`
```lua
require('antonym').add_dictionary({{'true', '0', mode = 'single'}})
```
要删除一个或一组对应关系，你可以这么做：
下面是一个删除`true`和`false`对应关系的例子
```lua
require('antonym').del_dictionary({{'true', 'false'}})
```


## 配置
该插件有以下可用设置：
```lua
require('antonym').setup({
  antonyms = {
    -- 在此处添加或覆盖匹配项。
    -- 例如：
    { 'worda', 'wordb' }
    -- 也可以用于删除
    { 'worda', 'wordb', del = true }
  },
  -- 插件加载时，此项用于设置替换单词的快捷键。
  -- 不推荐使用此方法！
  key = '<leader>wa' -- 将'<leader>wa'改为你使用的按键。
})
```
