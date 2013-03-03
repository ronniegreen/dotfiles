
" JANUS SETUP
" Define paths
let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
let g:janus_custom_path = expand("~/.janus")

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif


" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

" Load all groups, custom dir, and janus core
call janus#load_pathogen()


" PLUGIN MANAGEMENT

  filetype plugin on
  filetype indent on
  filetype plugin on

  let mapleader = ","
  let g:JSLintHighlightErrorLine = 0
  let g:EasyMotion_leader_key = '<Leader>'
  let g:ctrlp_map = '<Leader>t'
  let g:ctrlp_match_window_bottom = 0
  let g:ctrlp_match_window_reversed = 0
  " let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_dotfiles = 0
  let g:ctrlp_switch_buffer = 0

  " autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
  " autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
  " autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
  " autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
  " autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0


" MAPPINGS
  inoremap kj <Esc>
  inoremap <C-c> <Esc>

  nnoremap <leader>ev :vsplit $MYVIMRC<cr>
  nnoremap <leader>sv :source $MYVIMRC<cr>
  nnoremap <leader>cc iconsole.log()<Esc>i
  inoremap <leader>cc console.log()<Esc>i

  nnoremap <leader>tt :CommandT<cr>

  nnoremap <leader>// i//////////////////////////////////////////////<cr><cr><Backspace><Backspace><Esc>kA<Tab>$$<Space>
  inoremap <leader>// //////////////////////////////////////////////<cr><cr><Backspace><Backspace><Esc>kA<Tab>$$<Space>

  " PRETTY JSON
  " map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>


  " STUPID WRAPPED LINES
  nmap j gj
  nmap k gk

  " QUICK LINE INSERTION / MOVEMENT
  nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
  nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
  nnoremap <silent><C-S-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
  nnoremap <silent><C-S-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>


" UI AND SYNTAX
  syntax enable
  " set term=xterm-256color
  let g:solarized_termcolors=256
  set t_Co=16
  set background=dark
  " if has('gui_running')
  "   set background=light
  " else
  "   set background=dark
  " endif
  colorscheme solarized
  set clipboard=unnamed
  set number
  set hlsearch

  au BufRead,BufNewFile Cakefile setf=coffee
  au BufRead,BufNewFile *_html set syntax=html

" UNDO PERSISTENCE
  set undodir=~/.vim/undodir
  set undofile
  set undolevels=1000 "maximum number of changes that can be undone
  set undoreload=10000 "maximum number of lines to save for undo on a buffer reload

" BACKUP
  set backup
  set backupdir=~/tmp
  set nowritebackup
  set noswapfile

" FOLDS
  " set ]z and [z go to find open folds
  function! GoToOpenFold(direction)
    if (a:direction == "next")
      normal zj
      let start = line('.')
      while foldclosed(start) != -1
        let start = start + 1
      endwhile
    else
      normal zk
      let start = line('.')
      while foldclosed(start) != -1
        let start = start - 1
      endwhile
    endif
    call cursor(start, 0)
  endfunction
  " AUTOMATICALLY SAVE AND LOAD FOLDS
  au BufWinLeave * silent! mkview
  au BufWinEnter * silent! loadview 

" WATCH FOR CHANGES
set wrap
" set linebreak
" set nolist " list disables linebreak

" WatchForChanges
" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})

" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end

  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0

  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end

  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"

  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')

  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec

      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end

  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end

  " echo msg
  let @"=reg_saved
endfunction

let autoreadargs={'autoread':1}
execute WatchForChanges("*",autoreadargs)

set autoread
au BufEnter,BufWinEnter,CursorHold filename :checktime

" COFFEETAGS
" CoffeeTags with variables
" if executable('coffeetags')
"   let g:tagbar_type_coffee = {
"         \ 'ctagsbin' : 'coffeetags',
"         \ 'ctagsargs' : '--include-vars',
"         \ 'ctagsargs' : '--include-vars',
"         \ 'kinds' : [
"         \ 'f:functions',
"         \ 'o:object',
"         \ ],
"         \ 'sro' : ".",
"         \ 'kind2scope' : {
"         \ 'f' : 'object',
"         \ 'o' : 'object',
"         \ }
"         \ }
" endif

" CoffeeTags WITHOUT variables
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif
