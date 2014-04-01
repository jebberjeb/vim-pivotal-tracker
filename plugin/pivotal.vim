" Replace with your own values
let s:token = "<your pivotal tracker token>"
let s:project_id = "366911"

let s:access_args = " --token " . s:token . " --project-id " . s:project_id
let s:p_dir = expand('<sfile>:p:h')
let s:jar_pre = 'java -jar ' . s:p_dir . '/../pt.jar'
let s:lein_pre = 'lein run'

function! <SID>LoadStories()
    set autoread
    call inputsave()
    let query = input('Enter search query: ')
    call inputrestore()
    let cmd = s:jar_pre . s:access_args . ' --load-stories --query ' . shellescape(query)
    exec('!echo "' . cmd . '"; ' . cmd)
    exec(':e /tmp/stories.txt')
    nnoremap <buffer> <leader>ptw :call <SID>SaveStory()<cr>
endfunction

function! <SID>SaveStory()
    w
    "norm byw
    let wordUnderCursor = expand("<cword>")
    let cmd = s:jar_pre . s:access_args . ' --save-story ' . wordUnderCursor "@0
    exec('!echo "' . cmd . '"; ' . cmd)
    e
endfunction

nnoremap <leader>pte :call <SID>LoadStories()<cr>
nnoremap <leader>pts :source ~/.vim/bundle/vim-pivotal-tracker/plugin/pivotal.vim<CR>
nnoremap <leader>ptj :!lein uberjar<CR>

echo "pivotal script loaded!"
