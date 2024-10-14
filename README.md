# Neovim Custom Key Mappings Cheatsheet

## Leader Key

- **Leader Key:** `Space`

## General Mappings

- **Save File:** `Leader + w`
- **Quit Neovim:** `Leader + q`
- **File Explorer:** `Leader + e`
- **Clear Search Highlighting:** `ESC`

## Window Management

### Splitting Windows

- **Vertical Split:** `Leader + v`
- **Horizontal Split:** `Leader + h`

### Resizing Windows

- **Decrease Window Width:** `-`
- **Increase Window Width:** `+`
- **Increase Window Height:** `Ctrl + k`
- **Decrease Window Height:** `Ctrl + j`

### Rotating and Exchanging Windows

- **Rotate Windows:** `Leader + r`
- **Exchange with Next Window:** `Leader + x`

### Window Navigation

- **Move to Left Window:** `<Left Arrow>`
- **Move to Upper Window:** `<Up Arrow>`
- **Move to Right Window:** `<Right Arrow>`
- **Move to Bottom Window:** `<Down Arrow>`

## Commenting

- **Switch Comment Selected Text (Visual Mode):** `Alt + c`
- **Switch Comment Current Line (Normal Mode):** `Alt + c`

## Folding

- **Fold Current Block:** `Leader + f`
- **Unfold Below Cursor:** `Leader + u`
- **Fold All Blocks:** `Leader + F`
- **Unfold All Blocks:** `Leader + U`

# Adding a new plugin
To add a new plugin, modify lua/plugins/packer.lua file and run `:PackerSync`

# Config for LSP
- Install pyright:
`npm install -g pyright`
