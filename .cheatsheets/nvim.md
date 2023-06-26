Neovim/Vim Cheat Sheet

## Native Vim

[line sorting](https://webdevetc.com/blog/sort-text-in-vim/)

`:%s/<regexp>//gn`: Searches and shows number of matches

### Global Find and Replace

- Search with `?`.
- Use ^Q to put results in quickfix.
- Use `:cdo <sed command>`. eg. `:cdo s/something/somethingElse/gc`.

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

`:Mason`: Manage LSP downloads.

## NERDTree

`?`: Open quickhelp.
`i`: Open the node in a split.

## GitMessenger

`:GitMessenger`

`q`: Close the popup window.
`o`: older. Back to older commit at the line.
`O`: Opposite to o. Forward to newer commit at the line.
`d`: Toggle unified diff hunks only in current file of the commit.
`D`: Toggle all unified diff hunks of the commit.
`r`: Toggle word diff hunks only in current file of the commit.
`R`: Toggle all word diff hunks of current commit.
`?`: Show mappings help.

## symbols-outline.nvim

`o`: Go to symbol location in code without losing focus.
`Ctrl+Space`: Hover current symbol.
`K`: Toggles the current symbol preview.
`r`: Rename symbol.
`a`: Code actions.
`h`: fold symbol.
`l`: Unfold symbol.
`W`: Fold all symbols.
`E`: Unfold all symbols.
`R`: Reset all folding.
`?`: Show help message.
