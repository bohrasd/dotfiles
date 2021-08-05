{ config, pkgs, ... }:

with import <nixpkgs> {};
with builtins;
with lib;
with autoPatchelfHook;

let
linkerd = stdenv.mkDerivation {
  name = "linkerd";
  phases = [ "installPhase" ];
  src = fetchurl {
    url = "https://github.com/linkerd/linkerd2/releases/download/stable-2.9.5/linkerd2-cli-stable-2.9.5-linux-amd64";
    sha256 = "dd028bbfc238d2d8e916944f995d08725a6b311527be65d0919827f6c85fb504";
  };
  installPhase = ''
    mkdir -p $out/bin
    cp -v $src $out/bin/linkerd
    chmod +x $out/bin/linkerd
  '';
};
qshell = stdenv.mkDerivation {
  name = "qshell";
  phases = [ "installPhase" ];
  src = fetchurl {
    url = "https://devtools.qiniu.com/qshell-v2.6.2-linux-amd64.tar.gz";
    sha256 = "11mhd62d7kvwpwf2xk2n4c4f38pc1y7k5777wkcqym0ryvc9g855";
  };
  installPhase = ''
    tar xzf $src
    mkdir -p $out/bin
    cp -v ./qshell $out/bin/qshell
  '';
};
aliyun = stdenv.mkDerivation {
  name = "aliyun";
  phases = [ "installPhase" ];
  src = fetchurl {
    url = "https://github.com/aliyun/aliyun-cli/releases/download/v3.0.85/aliyun-cli-linux-3.0.85-amd64.tgz";
    sha256 = "1gcfw1w6q253yvdfjn5psqis7gg4z8wwc4k86bjzml7v0infbqc0";
  };
  installPhase = ''
    tar xzf $src
    mkdir -p $out/bin
    cp -v ./aliyun $out/bin/aliyun
  '';
};
argocd = stdenv.mkDerivation {
  name = "argocd";
  phases = [ "installPhase" ];
  src = fetchurl {
    url = "https://github.com/argoproj/argo-cd/releases/download/v2.0.5/argocd-util-linux-amd64";
  };
  installPhase = ''
    mkdir -p $out/bin
    cp -v $src $out/bin/argocd
    chmod +x $out/bin/argocd
  '';
};

dyff = stdenv.mkDerivation {
  name = "dyff";
  phases = [ "installPhase" ];
  src = fetchurl {
    url = "https://github.com/homeport/dyff/releases/download/v1.4.3/dyff_1.4.3_linux_amd64.tar.gz";
    sha256 = "35d12bdfcb709f5d82e5f458a958ec87c77674e406279659e7e2ded4486cdfe6";
  };
  installPhase = ''
    tar xzf $src
    mkdir -p $out/bin
    cp -v ./dyff $out/bin/dyff
  '';
};
in
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
      KITTY_ENABLE_WAYLAND = 1;
      WAYLAND_DISPLAY   = "wayland-0";
  };
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "DroidSansMono" ]; })
    pkgs.tree
    pkgs.wl-clipboard
    pkgs.glab
    pkgs.neofetch
    pkgs.aria2
    pkgs.go
    pkgs.gotools
    pkgs.goimports
    pkgs.gopls
    pkgs.delve
    pkgs.ginkgo
    pkgs.subversion
    pkgs.fortune
    pkgs.navi
    pkgs.ripgrep
    pkgs.fd
    pkgs.kubectl
    pkgs.krew
    pkgs.k9s
    pkgs.du-dust
    pkgs.ranger
    pkgs.jsonnet
    pkgs.jsonnet-bundler
    pkgs.manpages
    pkgs.libcap_manpages
    pkgs.gdb
    pkgs.gcc
    pkgs.strace
    pkgs.nodePackages.bash-language-server
    pkgs.bat
    pkgs.netcat
    pkgs.ncdu
    pkgs.step-cli
    pkgs.step-ca
    pkgs.swaks
    pkgs.kubernetes-helm
    pkgs.erlang
    pkgs.cowsay
    pkgs.wireshark-cli
    pkgs.nmap
    pkgs.translate-shell
    pkgs.clipman
    pkgs.p7zip
    pkgs.inetutils
    pkgs.nmap
    pkgs.yq
    pkgs.flyctl
    pkgs.vault
    pkgs.wrk
    linkerd
    qshell
    aliyun
    argocd
    dyff
  ];

  programs.jq.enable = true;
  programs.htop = {
      enable = true;
      settings = {
          left_meters = ["AllCPUs4" "Memory" "Swap"];
          left_meter_modes = [1 1 1];
          right_meters = ["Tasks" "LoadAverage" "Uptime" "Systemd" ];
          right_meter_modes = [2 2 2 2];
          fields = with config.lib.htop.fields; [
           PID
           USER
           PRIORITY
           NICE
           OOM
           M_SIZE
           M_RESIDENT
           M_SHARE
           STATE
           PERCENT_CPU
           PERCENT_MEM
           TIME
           COMM
          ];
          vim_mode = true;
      };
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
        {
          plugin = tmuxPlugins.power-theme;
          extraConfig = ''
            set -g @tmux_power_theme 'snow'
          '';
        }
      ];
      extraConfig = ''
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
      WORDCHARS         = "";
      PGOUSER           = "$HOME/.pgo/pgo/pgouser";
      PGO_CA_CERT       = "$HOME/.pgo/pgo/client.crt";
      PGO_CLIENT_CERT   = "$HOME/.pgo/pgo/client.crt";
      PGO_CLIENT_KEY    = "$HOME/.pgo/pgo/client.key";
      PGO_APISERVER_URL = "https://127.0.0.1:8443";
      PGO_NAMESPACE     = "pgo";
      CCP_CLI           = "kubectl";
      GOPATH            = "$HOME/go";
      GO111MODULE       = "auto";
      GITLAB_HOST       = "lqbyun.com";
      GIT_SSH           = "/usr/bin/ssh";
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
      papercolor-theme
      vim-surround
      vim-airline
      nerdcommenter
      nerdtree
      neomake
      vim-signify
      vim-go
      nvim-lspconfig
      nvim-compe
      vim-snippets
      ultisnips
      vim-visual-multi
      fzf
      fzf-vim
      tabular
    ];
    extraConfig = ''

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => nvim-lsp
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      lua << EOF
      local nvim_lsp = require('lspconfig')
      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<leader>Q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

        -- Set some keybinds conditional on server capabilities
        if client.resolved_capabilities.document_formatting then
          buf_set_keymap("n", "<leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        elseif client.resolved_capabilities.document_range_formatting then
          buf_set_keymap("n", "<leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        end

        -- Set autocommands conditional on server_capabilities
        if client.resolved_capabilities.document_highlight then
          vim.api.nvim_exec([[
            hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
            hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
            hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
            augroup lsp_document_highlight
              autocmd! * <buffer>
              autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
              autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
          ]], false)
        end
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
          properties = {
              'documentation',
              'detail',
              'additionalTextEdits',
          }
      }

      -- Use a loop to conveniently both setup defined servers
      -- and map buffer local keybindings when the language server attaches
      local servers = {
          "gopls",
          "bashls",
          "rust_analyzer",
      }
      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup { capabilities = capabilities, on_attach = on_attach }
      end

      require'compe'.setup {
          enabled = true;
          autocomplete = true;
          debug = false;
          min_length = 1;
          preselect = 'enable';
          throttle_time = 80;
          source_timeout = 200;
          incomplete_delay = 400;
          max_abbr_width = 100;
          max_kind_width = 100;
          max_menu_width = 100;
          documentation = true;

          source = {
              path = true;
              buffer = true;
              calc = true;
              nvim_lsp = true;
              nvim_lua = true;
              vsnip = false;
              ultisnips = true;
          };
      }
      EOF

      inoremap <silent><expr> <C-k>     compe#complete()
      inoremap <silent><expr> <CR>      compe#confirm('<CR>')
      inoremap <silent><expr> <C-e>     compe#close('<C-e>')
      inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
      inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

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
      let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow -E .git -E .svn'
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
      " => neomake
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " When writing a buffer (no delay).
      call neomake#configure#automake('w')
      " When writing a buffer (no delay), and on normal mode changes (after 750ms).
      call neomake#configure#automake('nw', 750)
      " When reading a buffer (after 1s), and when writing (no delay).
      call neomake#configure#automake('rw', 1000)
      " Full config: when writing or reading a buffer, and on changes in insert and
      " normal mode (after 500ms; no delay when writing).
      call neomake#configure#automake('nrwi', 500)

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => netrw
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      let g:netrw_liststyle = 3
      let g:netrw_browse_split = 4
      let g:netrw_altv = 1

      au FileType netrw setl bufhidden=wipe

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => General
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

      " With a map leader it's possible to do extra key combinations
      " like <leader>w saves the current file
      let mapleader = ","

      " save file
      nnoremap <leader>w :w<CR>

      " Prevent auto split line
      set formatoptions-=tc

      noremap <leader>d :NERDTreeToggle<CR>
      noremap <leader>f :NERDTreeFind<CR>

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => VIM user interface
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Ignore compiled files
      set wildignore=*.o,*~,*.pyc
      if has("win16") || has("win32")
          set wildignore+=.git\*,.hg\*,.svn\*
      else
          set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
      endif

      " A buffer becomes hidden when it is abandoned
      set hidden

      " Use the OS clipboard by default
      set clipboard+=unnamedplus

      set whichwrap+=<,>,h,l

      " Ignore case of searches
      set ignorecase

      " When searching try to be smart about cases
      set smartcase

      " Don't redraw while executing macros (good performance config)
      set lazyredraw

      " Show matching brackets when text indicator is over them
      set showmatch

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => Colors and Fonts
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Enable syntax highlighting
      syntax enable

      " Enable 256 colors palette in Gnome Terminal
      if $COLORTERM == 'gnome-terminal'
          set t_Co=256
      endif

      set background=dark

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " => Files, backups and undo
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Centralize backups, swapfiles and undo history
      set backupdir=~/.config/nvim/backups
      set noswapfile
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

      " Make tabs as wide as four spaces
      set tabstop=4
      " Make indentation as four space
      set shiftwidth=4

      " Linebreak on 500 characters
      set lbr
      set tw=80

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
      set termguicolors

      " Add the g flag to search/replace by default
      set gdefault
      " Respect modeline in files
      set modeline
      set modelines=4
      " Highlight current line
      set cursorline
      set mouse=a

      " nvim-compe required
      set completeopt=menuone,noselect

      " ultisnips config
      " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
      let g:UltiSnipsExpandTrigger = "<C-j>"
      " let g:UltiSnipsJumpForwardTrigger = "<c-b>"
      " let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
      " If you want :UltiSnipsEdit to split your window.
      let g:UltiSnipsEditSplit="vertical"

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

      " Go configuration
      let g:go_fmt_command = "goimports"
      let g:go_list_type = "quickfix"
      let g:go_term_mode = "split"
      let g:go_gopls_enabled = 0
      let g:go_def_mapping_enabled = 0

      colorscheme PaperColor
    '';
  };

  programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "fd --type f --hidden -E .git -E .svn ";
      fileWidgetCommand = "fd --type f --hidden -E .git -E .svn . \"$1\"";
      changeDirWidgetCommand = "fd --type d --hidden -E .git -E .svn . \"$1\"";
      tmux.enableShellIntegration = true;
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
}
