# Vim haskellcomplete

Official Haskell omni completion plugin distributed in Vim's runtime.

## Installation

If your Vim's runtime is up to date you should already have it, if not, you can
install it as a normal plugin.

Compatible with `Vundle`, `Vim-plug`, `Pathogen`, etc.

If you install it as an external plugin, you might need to set the *omnifunc*
with `setlocal omnifunc=haskellcomplete#Complete`.

Or add an auto command to your `.vimrc` file:

```vim
augroup ft_haskell
    au!
    au FileType haskell setlocal omnifunc=haskellcomplete#Complete
augroup END
```

## Usage

Use normal omni completion mechanisms.

```vim
:h i_CTRL-X_CTRL-O
```

## Available completions

- GHC language extensions pragma

```haskell
{-# LANGUAGE <complete here> #-}
```

- GHC flags pragma

```Haskell
{-# OPTIONS_GHC <complete here> #-}
```

- Core packages module names

```Haskell
import <complete here>
```

