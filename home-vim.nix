{ config, pkgs, ... }:

with import <nixpkgs> {};
with builtins;
with lib;
with autoPatchelfHook;

let
linkerd = stdenv.mkDerivation {
  name = "linkerd";
  phases = [ "installPhase" ];
  nativeBuildInputs = [
    autoPatchelfHook
  ];
  src = fetchurl {
    url = "https://github.com/linkerd/linkerd2/releases/download/stable-2.9.2/linkerd2-cli-stable-2.9.2-linux-amd64";
    sha256 = "67e51106600fe48315659e9e3261efd0169e6bb229ceb8d96af0eabd159624ef";
  };
  installPhase = ''
    cp -r ${src} $out
  '';
}; in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "bohrasd";
  home.homeDirectory = "/home/bohrasd";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  home.sessionPath = [
    "$HOME/.pgo/pgo"
    "$HOME/go"
    "$HOME/.krew/bin"
    "$HOME/.linkerd2/bin/"
  ];
  home.sessionVariables = {
      INPUT_METHOD = "fcitx";
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      WAYLAND_DISPLAY = "wayland-1";
  };

  home.packages = [
    pkgs.tree
    pkgs.bubblewrap
    pkgs.wl-clipboard
    pkgs.ldns
    pkgs.glab
    pkgs.neofetch
    pkgs.st
    pkgs.go
    pkgs.ginkgo
    pkgs.gh
    pkgs.subversion
    pkgs.fortune
    pkgs.navi
    pkgs.ripgrep
    pkgs.kubectl
    pkgs.krew
    pkgs.k9s
    pkgs.github-release
    pkgs.du-dust
    pkgs.ranger
    pkgs.jsonnet
    pkgs.jsonnet-bundler
    pkgs.manpages
    pkgs.libcap_manpages
    pkgs.gdb
    pkgs.gcc
    pkgs.bat
    pkgs.netcat
    pkgs.ncdu
    pkgs.step-cli
    pkgs.step-ca
    pkgs.kubernetes-helm
    pkgs.erlang
    pkgs.cowsay
    pkgs.wireshark-cli
    pkgs.nmap
    pkgs.translate-shell
    pkgs.clipman
    pkgs.p7zip
    linkerd
  ];

  programs.jq.enable = true;
  programs.htop = {
      enable = true;
      meters.left = ["AllCPUs4" "Memory" "Swap"];
      fields = [ "PID" "USER" "PRIORITY" "NICE" "OOM" "M_SIZE" "M_RESIDENT" "M_SHARE" "STATE" "PERCENT_CPU"
                 "PERCENT_MEM" "TIME" "COMM" ];
      vimMode = true;
  };

  programs.tmux = {
      enable = true;
      baseIndex = 1;
      escapeTime = 10;
      historyLimit = 5000;
      keyMode = "vi";
      prefix = "C-a";
      resizeAmount = 10;
      customPaneNavigationAndResize = true;
      plugins = [
        tmuxPlugins.sensible
        tmuxPlugins.yank
      ];
      extraConfig = ''
        set -g message-command-style "fg=#8ea6d6,bg=#323f4f"
        set -g status-right-style "none"
        set -g pane-active-border-style "fg=#a796dd"
        set -g status-style "none,bg=#323f4f"
        set -g message-style "fg=#8ea6d6,bg=#3d4c5f"
        set -g pane-border-style "fg=#323f4f"
        set -g status-right-length "100"
        set -g status-left-length "100"
        setw -g window-status-activity-style "none"
        setw -g window-status-separator " | "
        setw -g window-status-style "none,fg=#a796dd,bg=#3d4c5f"

        # Enable RGB colour if running in xterm(1)
        set-option -sa terminal-overrides ",tmux-256color:RGB"

        # Turn the mouse on, but without copy mode dragging
        set -g mouse on
        # unbind -n MouseDrag1Pane
        # unbind -Tcopy-mode MouseDrag1Pane

        # Some extra key bindings to select higher numbered windows
        bind-key | split-window -h -c "#{pane_current_path}"
        bind-key - split-window -v -c "#{pane_current_path}"

        bind -r C-h select-window -t :-
        bind -r C-l select-window -t :+

        # Keys to toggle monitoring activity in a window, and synchronize-panes
        bind m set monitor-activity
        bind y set synchronize-panes\; display 'synchronize-panes #{?synchronize-panes,on,off}'

        # Renumber windows when a window is closed
        set -g renumber-windows on
      '';
  };

  programs.git = {
    enable = true;
    userName  = "bohrasd";
    userEmail = "bohrasdf@gmail.com";
    extraConfig = ''
      [alias]
      l = log --pretty=oneline -n 20 --graph --abbrev-commit
      s = status -s
      p = push origin HEAD
      c = clone --recursive
      ca = !git add -A && git commit -av
      go = "!f() { git checkout -b \"''$1\" ''${2:-\"origin\"}/$1 2> /dev/null || git checkout -b \"''$1\" 2> /dev/null || git checkout \"''$1\"; }; f"
      tags = tag -l
      bs = branch -a
      b = branch
      co = checkout
      rs = remote -v
      amend = commit --amend --reuse-message=HEAD
      credit = "!f() { git commit --amend --author \"''$1 <''$2>\" -C HEAD; }; f"
      reb = "!r() { git rebase -i HEAD~''$1; }; r"
      retag = "!r() { git tag -d ''$1 && git push origin :refs/tags/''$1 && git tag ''$1; }; r"
      fb = "!f() { git branch -a --contains ''$1; }; f"
      ft = "!f() { git describe --always --contains ''$1; }; f"
      fc = "!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short -S''$1; }; f"
      fm = "!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short --grep=''$1; }; f"
      dm = "!git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d"
      contributors = shortlog --summary --numbered
    '';
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    defaultKeymap = "viins";
    dotDir = ".dotfiles/zsh";
    dirHashes = {
        docs  = "$HOME/Documents";
        vids  = "$HOME/Videos";
        dl    = "$HOME/Downloads";
    };
    sessionVariables = {
      WORDCHARS           = "";
      PGOUSER             = "$HOME/.pgo/pgo/pgouser";
      PGO_CA_CERT         = "$HOME/.pgo/pgo/client.crt";
      PGO_CLIENT_CERT     = "$HOME/.pgo/pgo/client.crt";
      PGO_CLIENT_KEY      = "$HOME/.pgo/pgo/client.key";
      PGO_APISERVER_URL   = "https://127.0.0.1:8443";
      PGO_NAMESPACE       = "pgo";
      CCP_CLI             = "kubectl";
      GOPATH              = "$HOME/go";
      GO111MODULE         = "auto";
      FZF_DEFAULT_COMMAND = "fd --type f";
      GITLAB_HOST         = "lqbyun.com";
      GIT_SSH             = "/usr/bin/ssh";
    };

    shellAliases = {
        rabbit="kubectl exec -ti -n duoji-staging-ns rabbitmq-staging-rabbitmq-ha-0 -- ";
        rabbit-prod="kubectl exec -ti -n duoji-production-ns rabbitmq-prod-rabbitmq-ha-0 -- ";
    };
    history = {
       expireDuplicatesFirst = true;
       extended = true;
       ignoreDups = true;
       ignoreSpace = true;
       path = "$HOME/.zsh_history";
    };
    initExtra = ''
      source ~/.dotfiles/.zshrc
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      kubernetes = {
        disabled = false;
      };
      env_var = {
        variable = "http_proxy";
        style = "dimmed bold bright-green";
      };
    };
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    withPython3 = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nerdtree
      vim-surround
      vim-airline
      nerdcommenter
      vim-easymotion
      vim-gitgutter
      vim-fugitive
      vim-snippets
      ultisnips
      syntastic
      vim-go
      nvim-lspconfig
      vim-visual-multi
      undotree
      vim-obsession
      fzf
      fzf-vim
      tabular
    ];
    extraConfig = ''

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => Tabular
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
      function! s:align()
        let p = '^\s*|\s.*\s|\s*$'
        if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
          let column = strlen(substitute(getline('.')[0:col('.')],'[^|]',''','g'))
          let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
          Tabularize/|/l1
          normal! 0
          call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
        endif
      endfunction

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => fzf.vim
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
        \   fzf#vim#with_preview(), <bang>0)

      function! RipgrepFzf(query, fullscreen)
        let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
        let initial_command = printf(command_fmt, shellescape(a:query))
        let reload_command = printf(command_fmt, '{q}')
        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
        call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
      endfunction

      command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => rust.vim
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " let g:rustfmt_autosave = 1

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => syntastic
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      let g:syntastic_always_populate_loc_list = 1
      let g:syntastic_auto_loc_list = 0
      let g:syntastic_check_on_open = 1
      let g:syntastic_check_on_wq = 0

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => CTRL-P
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " let g:ctrlp_max_height = 20
      " let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => General
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Sets how many lines of history VIM has to remember
      set history=500

      " Enable filetype plugins
      filetype plugin on
      filetype indent on

      " Set to auto read when a file is changed from the outside
      set autoread

      " With a map leader it's possible to do extra key combinations
      " like <leader>w saves the current file
      let mapleader = ","

      " save file
      nnoremap <leader>w :w<CR>

      " Prevent auto split line
      set formatoptions-=tc

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => VIM user interface
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Start scrolling three lines before the horizontal window border
      set scrolloff=3
      " Enhance command-line completion
      set wildmenu

      " Ignore compiled files
      set wildignore=*.o,*~,*.pyc
      if has("win16") || has("win32")
          set wildignore+=.git\*,.hg\*,.svn\*
      else
          set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
      endif

      " Show the cursor position
      set ruler

      " A buffer becomes hidden when it is abandoned
      set hidden

      " Use the OS clipboard by default
      set clipboard+=unnamedplus

      " Allow backspace in insert mode
      set backspace=indent,eol,start
      set whichwrap+=<,>,h,l

      " Ignore case of searches
      set ignorecase

      " When searching try to be smart about cases
      set smartcase

      " Highlight searches
      set hlsearch

      " Makes search act like search in modern browsers
      set incsearch

      " Don't redraw while executing macros (good performance config)
      set lazyredraw

      " For regular expressions turn magic on
      set magic

      " Show matching brackets when text indicator is over them
      set showmatch
      " How many tenths of a second to blink when matching brackets
      set mat=2

      " No annoying sound on errors
      set noerrorbells
      set novisualbell
      set t_vb=
      set tm=500

      " Properly disable sound on errors on MacVim
      if has("gui_macvim")
          autocmd GUIEnter * set vb t_vb=
      endif

      " Add a bit extra margin to the left
      set foldcolumn=1

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => Colors and Fonts
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Enable syntax highlighting
      syntax enable

      " Enable 256 colors palette in Gnome Terminal
      if $COLORTERM == 'gnome-terminal'
          set t_Co=256
      endif

      try
          colorscheme pablo
      catch
      endtry

      set background=dark

      " Set extra options when running in GUI mode
      if has("gui_running")
          set guioptions-=T
          set guioptions-=e
          set t_Co=256
          set guitablabel=%M\ %t
      endif

      " Highlight ColorColumn ctermbg=magenta
      " hi Pmenu guifg=fg guibg=#e0b0e0

      " Set utf8 as standard encoding and en_US as the standard language
      set encoding=utf8

      " Use Unix as the standard file type
      set ffs=unix,dos,mac

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => Files, backups and undo
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Centralize backups, swapfiles and undo history
      set backupdir=~/.config/nvim/backups
      set directory=~/.config/nvim/swaps
      if exists("&undodir")
          set undodir=~/.config/nvim/undo
          set undofile
      endif

      " Don’t create backups when editing files in certain directories
      set backupskip=/tmp/*,/private/tmp/*

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => Text, tab and indent related
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

      " Translate tabs to spaces
      set expandtab

      " Be smart when using tabs ;)
      set smarttab

      " Make tabs as wide as four spaces
      set tabstop=4
      " Make indentation as four space
      set shiftwidth=4

      " Linebreak on 500 characters
      set lbr
      set tw=80

      set ai "Auto indent
      set si "Smart indent
      set wrap "Wrap lines

      """"""""""""""""""""""""""""""
      " => Visual mode related
      """"""""""""""""""""""""""""""
      " Visual star search
      xnoremap *         : <C-u>call <SID>VSetSearch() <CR>/<C-R>=@/<CR><CR>
      xnoremap #         : <C-u>call <SID>VSetSearch() <CR>?<C-R>=@/<CR><CR>

      function! s:VSetSearch()
          let temp = @s
          norm! gv"sy
          let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
          let @s = temp
      endfunction

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => Moving around, tabs, windows and buffers
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      noremap <bs> <C-w>h
      noremap <C-h> <C-w>h
      noremap <C-j> <C-w>j
      noremap <C-k> <C-w>k
      noremap <C-l> <C-w>l

      " no highlighting temporary with <leader>hs
      noremap <silent> <leader>hs :nohlsearch<CR>

      " Close the current window.
      nnoremap <leader>cw :close<CR>
      " Delete current buffer
      nnoremap <leader>q :Bclose<cr>

      " Don't close window, when deleting a buffer
      command! Bclose call <SID>BufcloseCloseIt()
      function! <SID>BufcloseCloseIt()
          let l:currentBufNum = bufnr("%")
          let l:alternateBufNum = bufnr("#")

          if buflisted(l:alternateBufNum)
              buffer #
          else
              bnext
          endif

          if buflisted(l:currentBufNum)
              execute("bdelete! ".l:currentBufNum)
          endif
      endfunction

      " Close current tab
      nnoremap <leader>ct :tabclose<CR>
      " New tab
      nnoremap <leader>tn :tabnew<CR>
      " Close Location panel
      nnoremap <leader>ce :lclose<CR>

      " Switch buffers
      nnoremap <silent> [b :bprevious<CR>
      nnoremap <silent> ]b :bnext<CR>
      nnoremap <silent> [B :bfirst<CR>
      nnoremap <silent> ]B :blast<CR>

      " Switch tabs
      nnoremap <silent> [t :tabprevious<CR>
      nnoremap <silent> ]t :tabnext<CR>
      nnoremap <silent> [T :tabfirst<CR>
      nnoremap <silent> ]T :tablast<CR>

      " copen
      nnoremap <leader>co :copen<CR>

      " Let 'tl' toggle between this and the last accessed tab
      let g:lasttab = 1
      nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
      au TabLeave * let g:lasttab = tabpagenr()

      " cd to the directory containing the file in the buffer
      noremap <leader>cd :tcd %:h<CR>:pwd<cr>

      " Specify the behavior when switching between buffers
      try
        set switchbuf=useopen,usetab,newtab
        set stal=2
      catch
      endtry

      " Return to last edit position when opening files (You want this!)
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => Editing mappings
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Strip trailing whitespace (,ss)
      function! StripWhitespace()
          let save_cursor = getpos(".")
          let old_query = getreg('/')
          :%s/\(\s\+\|\)$//e
          call setpos('.', save_cursor)
          call setreg('/', old_query)
      endfunction

      if has("autocmd")
          " Trim trailing white space on save
          autocmd BufWritePre * :call StripWhitespace()
      endif

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => Misc
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Quickly open a buffer for scribble
      map <leader>z :e ~/buffer<cr>

      " Quickly open a markdown buffer for scribble
      map <leader>x :e ~/buffer.md<cr>

      """"""""""""""""""""""""""""""
      " => Shell section
      """"""""""""""""""""""""""""""
      if exists('$TMUX')
          if has('nvim')
              set termguicolors
          else
              set term=screen-256color
          endif
      endif

      " If you use vim inside tmux, see https://github.com/vim/vim/issues/993
      " set Vim-specific sequences for RGB colors
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

      " Automatic commands
      if has("autocmd")
          " Enable file type detection
          filetype on
          " Treat .json files as .js
          autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
          " Treat .md files as Markdown
          autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
          " Treat .html files as php
          " autocmd BufNewFile,BufRead *.html setlocal filetype=php
          " Enable emmet for ...
          " autocmd FileType html,css,php,go EmmetInstall
          " Shortcut to run python file
          autocmd FileType python nnoremap <buffer> <F9> :w<CR> :exec '!python3' shellescape(@%, 1)<CR>
          " Shortcut to run go
          autocmd FileType go nmap <leader>r <Plug>(go-run)
          " Use LSP omni-completion in Rust files
          autocmd BufRead,Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
          " Sign updated when save a file
          autocmd BufWritePost * GitGutter
          " Get the 2-space YAML as the default when hit carriage return after the colon
          autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
      endif


      " Add the g flag to search/replace by default
      set gdefault
      " Don’t add empty newlines at the end of files
      set noeol
      " Respect modeline in files
      set modeline
      set modelines=4
      " Enable per-directory .vimrc files and disable unsafe commands in them
      set exrc
      set secure
      " Enable line numbers
      set number
      " Highlight current line
      set cursorline
      " Show “invisible” characters
      set lcs=tab:▸\ ,trail:·,nbsp:_
      set list
      " Enable mouse in all modes
      set ttymouse=xterm2
      set mouse=a
      " Don’t reset cursor to start of line when moving around.
      " set nostartofline
      " Don’t show the intro message when starting Vim
      " set shortmess=atI
      " Show the current mode
      set showmode
      " Show the filename in the window titlebar
      set title
      " Show the (partial) command as it’s being typed
      set showcmd
      " Use relative line numbers
      if exists("&relativenumber")
          set relativenumber
          au BufReadPost * set relativenumber
      endif

      set completeopt=longest,menuone

      " Add spaces after comment delimiters by default
      let g:NERDSpaceDelims = 1
      " Use compact syntax for prettified multi-line comments
      let g:NERDCompactSexyComs = 1
      " Align line-wise comment delimiters flush left instead of following code indentation
      let g:NERDDefaultAlign = 'left'

      " ultisnips config
      " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
      let g:UltiSnipsExpandTrigger = "<C-j>"
      " let g:UltiSnipsJumpForwardTrigger = "<c-b>"
      " let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
      " If you want :UltiSnipsEdit to split your window.
      let g:UltiSnipsEditSplit="vertical"

      " Enable HTML/CSS syntax highlighting in js file
      let g:javascript_enable_domhtmlcss = 1
      let g:javascript_plugin_jsdoc = 1


      noremap <C-p> :Files<CR>
      noremap <leader>b :Buffers<CR>
      noremap <leader>tg :call <SID>CommonBufTag()<CR>
      function! s:CommonBufTag()
          if &ft=='go'
              execute "GoDecls"
          else
              execute "BTags"
          endif
      endfunction
      noremap <leader>m :History<CR>
      noremap <leader>d :NERDTreeToggle<CR>
      noremap <leader>f :NERDTreeFind<CR>
      " noremap <bs> :tabprevious<CR>
      " noremap <C-l> :tabnext<CR>
      " brackets input
      nnoremap <silent> [a :lprevious<CR>
      nnoremap <silent> ]a :lnext<CR>
      inoremap [ []<esc>i
      inoremap { {}<esc>i
      inoremap {<CR> {<CR>}<c-o>O
      inoremap ( ()<esc>i
      inoremap <> <><esc>i
      inoremap " ""<esc>i
      " set text wrapping toggles
      noremap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>
      " set \ to ,
      noremap \ ,
      nnoremap <leader>a :RG<space>
      noremap <leader>l  : Tab/
      " nnoremap <C-Tab>   : <C-6><CR>
      nnoremap <leader>gs :Gstatus<CR>
      nnoremap <leader>gc :Git commit<CR>
      nnoremap <leader>gp :Git push origin HEAD<CR>
      nnoremap <leader>gr :Git rebase<CR>
      nnoremap <leader>gl :Git pull<CR>
      " Switch quickfix
      nnoremap [q :cprevious<CR>
      nnoremap ]q :cnext<CR>
      " Switch location list
      nnoremap [l :lprevious<CR>
      nnoremap ]l :lnext<CR>
      " Down is really the next line
      nnoremap j gj
      nnoremap k gk
      " Resize vsplit
      nmap 25s :vertical resize 40<cr>
      nmap 50s <c-w>=
      nmap 75s :vertical resize 120<cr>
      nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
      nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
      nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
      nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
      " Undotree
      nnoremap <leader>u :UndotreeToggle<cr>

      com Wdt windo diffthis
      com Wdo diffoff!

      nnoremap <silent> <Leader>scb :windo set scrollbind!<CR>

      nnoremap <C-6> <C-^>
      " Select the last changed text(or the text that was just pasted)
      nnoremap gp `[v`]

      " Diff current buffer and the original file
      function! s:DiffWithSaved()
          let filetype=&ft
          diffthis
          vnew | r # | normal! 1Gdd
          diffthis
          exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
      endfunction
      com! DiffSaved call s:DiffWithSaved()

      command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
      function! QuickfixFilenames()
          " Building a hash ensures we get each buffer only once
          let buffer_numbers = {}
          for quickfix_item in getqflist()
              let bufnr = quickfix_item['bufnr']
              " Lines without files will appear as bufnr=0
              if bufnr > 0
                  let buffer_numbers[bufnr] = bufname(bufnr)
              endif
          endfor
          return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
      endfunction

      " Emmet configuration
      " only enable in insert mode.
      let g:user_emmet_mode = 'i'
      " disable global install
      let g:user_emmet_install_global = 0
      " redefine emmet trigger key
      let g:user_emmet_leader_key = '<C-z>'

      " Go configuration
      let g:go_fmt_command = "goimports"
      let g:go_list_type = "quickfix"
      let g:go_term_mode = "split"
    '';
  };

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
}
