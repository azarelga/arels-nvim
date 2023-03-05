vim.keymap.set('n','<c-,>',':BufferPrevious <cr>')
vim.keymap.set('n','<c-.>',':BufferNext  <cr>')
vim.keymap.set('n','<c-1>',':BufferGoto 1 <cr>')
vim.keymap.set('n','<c-0x40>',':BufferGoto 2 <cr>')
vim.keymap.set('n','<c-\'>',':BufferGoto 4 <cr>')
vim.keymap.set('n','<c-a>',':BufferClose  <cr>')

vim.api.nvim_create_autocmd({'BufWinLeave', 'BufWipeout'}, {
  callback = function(tbl)
    if vim.bo[tbl.buf].filetype == 'NvimTree' then
      require'bufferline.api'.set_offset(0)
    end
  end
})
