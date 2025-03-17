# telescope-tree-focus

Simple neovim plugin that allows to pick directory and then focus it in file
tree.

Supports only nvim-tree.

## Dependencies

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

## Configuration

Minimal:

```lua
local ttf = require("telescope-tree-focus")
vim.keymap.set("n", "<a-d>", ttf.open_picker)
```

With all options:

```lua
local ttf = require("telescope-tree-focus")

ttf.find_command = {
    "fd",
    "--hidden",
    "--type",
    "directory",
    "--exclude",
    ".git",
}
ttf.prompt_title = "Find Directories"
ttf.expand_focused = true

vim.keymap.set("n", "<a-d>", ttf.open_picker)
```
