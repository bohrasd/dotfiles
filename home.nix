{ config, pkgs, ... }:

with import <nixpkgs> { config = { allowUnfree = true; }; };
with builtins;
with lib;
with autoPatchelfHook;

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "$USER";
  home.homeDirectory = (if pkgs.stdenv.isLinux then "/home/$USER" else "/Users/$USER");

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  home.sessionPath = [
    "$HOME/go"
    "$HOME/.krew/bin"
    "$HOME/.linkerd2/bin/"
  ];
  home.sessionVariables = {
      #GDK_SCALE = 2;
      #GDK_DPI_SCALE = 0.5;
      #MOZ_DISABLE_RDD_SANDBOX = 1;
      WAYLAND_DISPLAY   = "wayland-0";
  };
  fonts.fontconfig.enable = pkgs.stdenv.isLinux;
  home.packages = [
    pkgs.dogdns
    #pkgs.argocd
    pkgs.tree
    #pkgs.glab
    pkgs.gh
    pkgs.go
    pkgs.gotools
    pkgs.gopls
    pkgs.delve
    pkgs.subversion
    pkgs.ripgrep
    pkgs.fd
    pkgs.kubectl
    pkgs.krew
    pkgs.k9s
    pkgs.gdb
    pkgs.gcc
    pkgs.nodePackages.bash-language-server
    pkgs.nodePackages.typescript-language-server
    pkgs.terraform-ls
    pkgs.netcat
    pkgs.ncdu
    pkgs.step-cli
    pkgs.step-ca
    pkgs.swaks
    pkgs.kubernetes-helm
    pkgs.cowsay
    pkgs.nmap
    pkgs.inetutils
    pkgs.yq
    pkgs.fx
    pkgs.jo
    pkgs.jc
    #pkgs.skaffold
    pkgs.flavours
    #pkgs.buildpack
    #pkgs.telepresence2
    pkgs.vault
    pkgs.wrk
    pkgs.hey
    pkgs.navi
    awscli2
    ssm-session-manager-plugin
    #tfswitch
    jsonnet
    sshuttle
    dyff
    gnupg
    bitwarden-cli
    cobalt
    nodejs-16_x
    pam-reattach
  ]  ++ (if pkgs.stdenv.isLinux then [
    pkgs.trivy
    pkgs.translate-shell
    pkgs.skopeo
    pkgs.umoci
    pkgs.nerdctl
    pkgs.neofetch
    pkgs.rclone
    pkgs.aria2
    pkgs.clipman
    pkgs.strace
    pkgs.man-pages
    pkgs.libcap.doc
    pkgs.wl-clipboard
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "DroidSansMono" ]; })
  ] else [
    pkgs.coreutils
    watch
  ]);

  programs.jq.enable = true;
  programs.htop = {
      enable = true;
  };

  programs.tmux = {
      enable = true;
      baseIndex = 1;
      escapeTime = 10;
      keyMode = "vi";
      prefix = "C-a";
      resizeAmount = 5;
      customPaneNavigationAndResize = true;
      plugins = [
        tmuxPlugins.sensible
        tmuxPlugins.yank
      ];
      extraConfig = ''
        source-file ~/.config/tmux/theme
        # Enable RGB colour if running in xterm(1)
        set-option -sa terminal-overrides ",tmux-256color:RGB"

        # Keys to toggle monitoring activity in a window, and synchronize-panes
        bind m set monitor-activity
        bind y set synchronize-panes\; display 'synchronize-panes #{?synchronize-panes,on,off}'

        # Some extra key bindings to select higher numbered windows
        bind-key | split-window -h -c "#{pane_current_path}"
        bind-key - split-window -v -c "#{pane_current_path}"

        # Renumber windows when a window is closed
        set -g renumber-windows on

        setw -g window-status-format "#(basename #{pane_current_path})".
      '';
  };

  programs.git = {
    enable = true;
    userName  = "bohrasd";
    userEmail = "bohrasdf@gmail.com";
    aliases = {
      l = "log --pretty=oneline -n 20 --graph --abbrev-commit";
      s = "status -s";
      p = "push origin HEAD";
      c = "clone --recursive";
      ca = "!git add -A && git commit -av";
      go = ''
      "!f() { git checkout -b \"''$1\" ''${2:-\"origin\"}/$1 2> /dev/null || git checkout -b \"''$1\" 2> /dev/null || git checkout \"''$1\"; }; f"
      '';
      tags = "tag -l";
      bs = "branch -a";
      b = "branch";
      co = "checkout";
      rs = "remote -v";
      amend = "commit --amend --reuse-message=HEAD";
      fb = "!f() { git branch -a --contains ''$1; }; f";
      ft = "!f() { git describe --always --contains ''$1; }; f";
      fc = "!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short -S''$1; }; f";
      fm = "!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short --grep=''$1; }; f";
      dm = "!git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d";
      contributors = "shortlog --summary --numbered";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "emacs";
    dotDir = ".dotfiles/zsh";
    dirHashes = {
        docs  = "$HOME/Documents";
        vids  = "$HOME/Videos";
        dl    = "$HOME/Downloads";
    };
    sessionVariables = {
      WORDCHARS         = "";
      DR                = " --dry-run=client -o yaml ";
      GOPATH            = "$HOME/go";
      GO111MODULE       = "auto";
      GIT_SSH           = "/usr/bin/ssh";
      VAULT_ADDR = "https://v.ikeypose.com";
      AWS_CLI_AUTO_PROMPT = "on";
      ASCIINEMA_API_URL = "https://asciinema.ikeypose.com";
    };

    shellAliases = {
        sns="kubectl config set-context --current --namespace $(kubectl get ns -o name | fzf | cut -d/ -f2)";
        assume="source assume";
        kct="kubectl config use-context $(kubectl config get-contexts -o name | fzf)";
        tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale";
        #docker="podman";
        #docker-compose="compose";
    };
    history = {
       expireDuplicatesFirst = true;
       extended = true;
       ignoreDups = true;
       ignorePatterns = [
        "(cd|cp|mv|ls|ll|rm|vim?|man|which|mkdir|head|tail|bat|find|echo|man|vim|vi) *"
        "(ping|diff|pgrep|p?kill) *"
        "sudo (chown|chmod|vi|p?kill|cp|mv)"
        "k *"
        "flatpak *"
        #"(docker|git|step) *"
        "sudo dnf (install|search|update|copr|reinstall|remove|history|group) *"
        "git (add|commit|push|pull|go) *"
        "terraform apply -target*"
       ];
       ignoreSpace = true;
       path = "$HOME/.zsh_history";
    };
    initExtraBeforeCompInit = ''
      fpath=($HOME/.dotfiles/zsh/my-site-functions $fpath)
    '';
    initExtra = ''
      source $HOME/.dotfiles/.zshrc
    '';
  };

  programs.fish = {
    enable = true;
    plugins = [];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      format = "$kubernetes$env_var$aws$custom$line_break$all$line_break$character";
      kubernetes = {
        disabled = false;
        style = "blue";
      };
      env_var = {
        PROXY = {
            variable = "http_proxy";
            style = "dimmed bold bright-green";
        };
        KOPS = {
            symbol = "ⓚ ";
            format = "[\${symbol}$env_value]($style) ";
            variable = "CLUSTER_NAME";
            style = "bright-green";
        };
      };
      aws = {
          format = "on [$symbol($profile )(\($region\) )]($style)";
          symbol = "🅰 ";
          region_aliases = {
              ap-southeast-1 = "sg";
              us-east-1 = "nv";
              ap-northeast-1 = "tokyo";
          };
      };
      custom = {
        oidc = {
            disabled = true;
            command = ''
                Arn=arn:aws:iam::$(grep -r ''${AWS_ACCESS_KEY_ID:-none} ~/.oidc2aws/ | grep -o "[0-9]\{11,13\}"):role/OrganizationAccountAccessRole && tomlq -r --arg Arn "$Arn" -c '.alias | to_entries[] | select(.value.roleChain[-1]==$Arn) .key' ~/.oidc2aws/oidcconfig
            '';
            when = "test \"$AWS_ACCESS_KEY_ID\" != \"\"";
            shell = "zsh";
            style = "bright-yellow";
        };
      };
    };
  };

  programs.neovim = {
    enable = true;
    #package = pkgs.neovim-nightly;
    withPython3 = true;
    viAlias = false;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-surround
      copilot-vim
      {
          plugin = lightline-vim;
          config = "let g:lightline = {'colorscheme': 'one'}";
      }
      nerdcommenter
      nerdtree
      undotree
      {
          plugin = neomake;
          config = ''
            " When writing a buffer (no delay).
            call neomake#configure#automake('w')
            " When writing a buffer (no delay), and on normal mode changes (after 750ms).
            call neomake#configure#automake('nw', 750)
            " When reading a buffer (after 1s), and when writing (no delay).
            call neomake#configure#automake('rw', 1000)
            " Full config: when writing or reading a buffer, and on changes in insert and
            " normal mode (after 500ms; no delay when writing).
            call neomake#configure#automake('nrwi', 500)
          '';
      }
      vim-signify
      vim-fugitive
      {
          plugin = vim-go;
          config = ''

              " Go configuration
              let g:go_fmt_command = "goimports"
              let g:go_list_type = "quickfix"
              let g:go_term_mode = "split"
              let g:go_gopls_enabled = 0
              let g:go_def_mapping_enabled = 0
          '';
      }
      nvim-lspconfig
      friendly-snippets
      vim-vsnip
      nvim-cmp
      cmp-nvim-lsp
      cmp-vsnip
      cmp-buffer
      cmp-cmdline
      cmp-path
      vim-visual-multi
      fzf-vim
      tabular
      {
          plugin = vim-terraform;
          config = "let g:terraform_fmt_on_save = 1";
      }
      vim-jsonnet

    ];
    extraConfig = ''

      lua << EOF
      -- Setup nvim-cmp.
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          { name = 'path' },
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      -- nvim-lsp
      local opts = { noremap=true, silent=true }
      vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

        -- Set some keybinds conditional on server capabilities
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        elseif client.server_capabilities.documentRangeFormattingProvider then
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        end

        -- Set autocommands conditional on server_capabilities
        if client.server_capabilities.documentHighlight then
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

      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
          properties = {
              'documentation',
              'detail',
              'additionalTextEdits',
          }
      }

      -- Use a loop to conveniently call 'setup' on multiple servers and
      -- map buffer local keybindings when the language server attaches
      local servers = {
          "gopls",
          "bashls",
          "pylsp",
          "terraformls"
          -- "rust_analyzer",
      }
      for _, lsp in pairs(servers) do
        require('lspconfig')[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = {
            debounce_text_changes = 150,
          }
        }
      end

      EOF
      "autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()

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
      set clipboard+=unnamedplus

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
      "set tw=80
      set tw=0
      set wm=0

      " yaml weird issue https://github.com/vim/vim/issues/2049
      set mmp=5000

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

      """"""""""""""""""""""""""""""
      " => Shell section
      """"""""""""""""""""""""""""""

      " Add the g flag to search/replace by default
      set gdefault
      " Respect modeline in files
      set modeline
      set modelines=4
      " Highlight current line
      set cursorline
      set mouse=a

      """"""""""""""""""
      """" vsnip
      """"""""""""""""""
      " Expand
      imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
      smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

      " Expand or jump
      imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
      smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

      " Jump forward or backward
      imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
      smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
      imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
      smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

      " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
      " See https://github.com/hrsh7th/vim-vsnip/pull/50
      nmap        s   <Plug>(vsnip-select-text)
      xmap        s   <Plug>(vsnip-select-text)
      nmap        S   <Plug>(vsnip-cut-text)
      xmap        S   <Plug>(vsnip-cut-text)

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
      nnoremap <leader>gs :Git<CR>
      nnoremap <leader>gc :Git commit<CR>
      nnoremap <leader>gp :Git push origin HEAD<CR>
      nnoremap <leader>gr :Git rebase<CR>
      nnoremap <leader>gl :Git pull<CR>
      nnoremap [q :cprevious<CR>
      nnoremap ]q :cnext<CR>
      " Switch location list
      nnoremap [l :lprevious<CR>
      nnoremap ]l :lnext<CR>
      " Down is really the next line
      nnoremap j gj
      nnoremap k gk
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


      "colorscheme PaperColor
      colorscheme base16
      set termguicolors
    '';
  };

  programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      defaultCommand = "fd --type f --hidden -E .git -E .svn ";
      fileWidgetCommand = "fd --type f --hidden -E .git -E .svn . \"$1\"";
      changeDirWidgetCommand = "fd --type d --hidden -E .git -E .svn . \"$1\"";
      tmux.enableShellIntegration = true;
  };

  #nixpkgs.overlays = [
  #  (import (builtins.fetchTarball {
  #    url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  #  }))
  #];
}
