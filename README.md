# Vim haskellcomplete

Omni Completion for Haskell.

## Installation

Compatible with `Vundle`, `Vim-plug`, `Pathogen`, etc.


## Usage

Set the *omnifunc* with `setlocal omnifunc=haskellcomplete#Complete`.

Or add an auto command to your `.vimrc` file:

```vim
augroup ft_haskell
    au!
    au FileType haskell setlocal omnifunc=haskellcomplete#Complete
augroup END
```
