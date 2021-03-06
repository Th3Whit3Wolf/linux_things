let b:endwise_addition = 'End &'
let b:endwise_words = 'Function,Sub,Class,Module,Enum,Namespace'
let b:endwise_pattern = '\%(\<End\>.*\)\@<!\<&\>'
let b:endwise_syngroups = 'vbStatement,vbnetStorage,vbnetProcedure,vbnet.*Words,AspVBSStatement'

if !stridx(&rtp, resolve(expand('~/.config/nvim/lazy/vim-endwise.vim'))) == 0
    execute 'source' fnameescape(resolve(expand('~/.config/nvim/lazy/vim-endwise.vim')))
endif

imap <buffer> <CR> <CR><Plug>DiscretionaryEnd