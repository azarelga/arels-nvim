# arels-nvim

do you hate your mouse? have you ever felt tired of using vs code because how simple it is to use it? are you those type of person who preferred ordering fresh beans of coffee and grind them for about 10 minutes or so rather than buying instant coffee? do you like to impress your friends with your weird obscure skills. thank you for answering these trivial questions. anyways, this is my lua config for my neovim.

# table of contents
- [plugins](#plugins)
- [keymappings](#my-keymapping)
- [personal snippets](#personal-snippets)

# plugins
- packer as package manager
- telescope as fuzzy finder
- nvimtree as sidebar file manager
- vimtex
- catpuccin theme (i think i mispronounce it)
- treesitter
- cmp as lsp (with vsnip, [friendly-snippets](https://github.com/rafamadriz/friendly-snippets), and auto-parenthesis)
- mason as lsp, linter, daq manager
- floaterm
- symbols-outline

# my keymapping

keep in mind that keymapping disini ngikutin layout keyboard macbook 

`<leader>` : Space

### nvim-tree

`<leader>t` : Buka `nvim-tree`

### symbols-outline

`<leader>s` : Buka `symbols-outline` (show objects and functions)

### telescope

`Space-ff` : Buka `telescope`

### treesitter

`Space-e` : Buka diagnostics dari `treesitter`

`[d` : Previous diagnostic

`]d` : Next diagnostic

### floaterm

`Ctrl-x` : Buka floaterm biasa

`Ctrl-p` : Buka floaterm python

`Ctrl-c` : Buka floaterm buat execute code

# personal snippets

everything else here that are not mentioned is a snippet from lsp or [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) as you may check it out on its respected repository. the rest here is just the taste of connoiseur of snippets, azarel grahandito adi.
lang | prefix        | description           | result  | 
| ---------- | ------------- |:--------------------:| --------:|
| C          | `letsgo`      | my go-to c starter   | `#include <stdio.h> #include <math.h> #include <string.h> #include <stdlib.h> #include <stdbool.h> typedef long long int ll; typedef unsigned long long int ull; int main() { }`|
