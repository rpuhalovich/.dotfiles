# Neovim Cheat Sheet

[line sorting](https://webdevetc.com/blog/sort-text-in-vim/)

## lsp-zero

[From here.](https://github.com/VonHeikemen/lsp-zero.nvim)

`K`: Displays hover information about the symbol under the cursor in a floating window.

`gd`: Jumps to the definition of the symbol under the cursor.
`gD`: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature.
`gi`: Lists all the implementations for the symbol under the cursor in the quickfix window.
`go`: Jumps to the definition of the type of the symbol under the cursor.
`gr`: Lists all the references to the symbol under the cursor in the quickfix window.
`gs`: Displays signature information about the symbol under the cursor in a floating window.

`<F2>`: Renames all references to the symbol under the cursor.
`<F3>`: Format code in current buffer.
`<F4>`: Selects a code action available at the current cursor position.

`gl`: Show diagnostics in a floating window.
`[d`: Move to the previous diagnostic in the current buffer.
`]d`: Move to the next diagnostic.

## NERDTree

`?`: Open quickhelp.
`i`: Open the node in a split.
