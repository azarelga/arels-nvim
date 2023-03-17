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

keep in mind the keymappings that are listed here are based on macbook pro's finland keyboard (i know its absurd but trust me when i say this, switch to a macbook) 

`<leader>` : Space

### nvim-tree

`<leader>t` : open `nvim-tree`

### symbols-outline

`<leader>s` : open `symbols-outline` (show objects and functions)

### telescope

`Space-ff` : open `telescope`

### treesitter

`Space-e` : open diagnostics from `treesitter`

`[d` : previous diagnostic

`]d` : next diagnostic

### floaterm

`Ctrl-x` : open regular ole floaterm 

`Ctrl-p` : open floaterm with python

`Ctrl-c` : open floaterm to execute code (works only for ` .c ` and ` .cpp `)

`<leader>lg` : open lazygit (you need to install it first on your shell)

### competitest (the bfd for your cp needs)

`Ctrl-t` : add them testcase

`Ctrl-r` : run them testcase(s)

`Ctrl-e` : edit them testcase

# personal snippets

snippets are from lsp or [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) as you may check it out on its respected repository. i added some of my most often used (personally) snippets of code here.
lang | prefix        | description           | result  | 
| ---------- | ------------- |:--------------------:| --------:|
| C          | `letsgo`      | my go-to c starter   | `#include <stdio.h> #include <math.h> #include <string.h> #include <stdlib.h> #include <stdbool.h> typedef long long int ll; typedef unsigned long long int ull; int main() { }`|
