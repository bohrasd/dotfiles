compdef _argocd argocd


function _argocd {
  local -a commands

  _arguments -C \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "account:Manage account settings"
      "app:Manage applications"
      "cert:Manage repository certificates and SSH known hosts entries"
      "cluster:Manage cluster credentials"
      "completion:output shell completion code for the specified shell (bash or zsh)"
      "context:Switch between contexts"
      "gpg:Manage GPG keys used for signature verification"
      "login:Log in to Argo CD"
      "logout:Log out from Argo CD"
      "proj:Manage projects"
      "relogin:Refresh an expired authenticate token"
      "repo:Manage repository connection parameters"
      "repocreds:Manage repository connection parameters"
      "version:Print version information"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  account)
    _argocd_account
    ;;
  app)
    _argocd_app
    ;;
  cert)
    _argocd_cert
    ;;
  cluster)
    _argocd_cluster
    ;;
  completion)
    _argocd_completion
    ;;
  context)
    _argocd_context
    ;;
  gpg)
    _argocd_gpg
    ;;
  login)
    _argocd_login
    ;;
  logout)
    _argocd_logout
    ;;
  proj)
    _argocd_proj
    ;;
  relogin)
    _argocd_relogin
    ;;
  repo)
    _argocd_repo
    ;;
  repocreds)
    _argocd_repocreds
    ;;
  version)
    _argocd_version
    ;;
  esac
}


function _argocd_account {
  local -a commands

  _arguments -C \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "can-i:Can I"
      "delete-token:Deletes account token"
      "generate-token:Generate account token"
      "get:Get account details"
      "get-user-info:Get user info"
      "list:List accounts"
      "update-password:Update password"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  can-i)
    _argocd_account_can-i
    ;;
  delete-token)
    _argocd_account_delete-token
    ;;
  generate-token)
    _argocd_account_generate-token
    ;;
  get)
    _argocd_account_get
    ;;
  get-user-info)
    _argocd_account_get-user-info
    ;;
  list)
    _argocd_account_list
    ;;
  update-password)
    _argocd_account_update-password
    ;;
  esac
}

function _argocd_account_can-i {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_account_delete-token {
  _arguments \
    '(-a --account)'{-a,--account}'[Account name. Defaults to the current account.]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_account_generate-token {
  _arguments \
    '(-a --account)'{-a,--account}'[Account name. Defaults to the current account.]:' \
    '(-e --expires-in)'{-e,--expires-in}'[Duration before the token will expire. (Default: No expiration)]:' \
    '--id[Optional token id. Fallback to uuid if not value specified.]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_account_get {
  _arguments \
    '(-a --account)'{-a,--account}'[Account name. Defaults to the current account.]:' \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide|name]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_account_get-user-info {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: yaml, json]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_account_list {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide|name]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_account_update-password {
  _arguments \
    '--account[an account name that should be updated. Defaults to current user account]:' \
    '--current-password[current password you wish to change]:' \
    '--new-password[new password you want to update to]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}


function _argocd_app {
  local -a commands

  _arguments -C \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "actions:Manage Resource actions"
      "create:Create an application"
      "delete:Delete an application"
      "diff:Perform a diff against the target and live state."
      "edit:Edit application"
      "get:Get application details"
      "history:Show application deployment history"
      "list:List applications"
      "manifests:Print manifests of an application"
      "patch:Patch application"
      "patch-resource:Patch resource in an application"
      "resources:List resource of application"
      "rollback:Rollback application to a previous deployed version by History ID"
      "set:Set application parameters"
      "sync:Sync an application to its target state"
      "terminate-op:Terminate running operation of an application"
      "unset:Unset application parameters"
      "wait:Wait for an application to reach a synced and healthy state"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  actions)
    _argocd_app_actions
    ;;
  create)
    _argocd_app_create
    ;;
  delete)
    _argocd_app_delete
    ;;
  diff)
    _argocd_app_diff
    ;;
  edit)
    _argocd_app_edit
    ;;
  get)
    _argocd_app_get
    ;;
  history)
    _argocd_app_history
    ;;
  list)
    _argocd_app_list
    ;;
  manifests)
    _argocd_app_manifests
    ;;
  patch)
    _argocd_app_patch
    ;;
  patch-resource)
    _argocd_app_patch-resource
    ;;
  resources)
    _argocd_app_resources
    ;;
  rollback)
    _argocd_app_rollback
    ;;
  set)
    _argocd_app_set
    ;;
  sync)
    _argocd_app_sync
    ;;
  terminate-op)
    _argocd_app_terminate-op
    ;;
  unset)
    _argocd_app_unset
    ;;
  wait)
    _argocd_app_wait
    ;;
  esac
}


function _argocd_app_actions {
  local -a commands

  _arguments -C \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "list:Lists available actions on a resource"
      "run:Runs an available action on resource(s)"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  list)
    _argocd_app_actions_list
    ;;
  run)
    _argocd_app_actions_run
    ;;
  esac
}

function _argocd_app_actions_list {
  _arguments \
    '--group[Group]:' \
    '--kind[Kind]:' \
    '--namespace[Namespace]:' \
    '(-o --out)'{-o,--out}'[Output format. One of: yaml, json]:' \
    '--resource-name[Name of resource]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_actions_run {
  _arguments \
    '--all[Indicates whether to run the action on multiple matching resources]' \
    '--group[Group]:' \
    '--kind[Kind]:' \
    '--namespace[Namespace]:' \
    '--resource-name[Name of resource]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_create {
  _arguments \
    '--auto-prune[Set automatic pruning when sync is automated]' \
    '--config-management-plugin[Config management plugin name]:' \
    '--dest-name[K8s cluster Name (e.g. minikube)]:' \
    '--dest-namespace[K8s target namespace (overrides the namespace specified in the ksonnet app.yaml)]:' \
    '--dest-server[K8s cluster URL (e.g. https://kubernetes.default.svc)]:' \
    '--directory-recurse[Recurse directory]' \
    '--env[Application environment to monitor]:' \
    '(-f --file)'{-f,--file}'[Filename or URL to Kubernetes manifests for the app]:filename:_files -g "json" -g "yaml" -g "yml"' \
    '--helm-chart[Helm Chart name]:' \
    '*--helm-set[Helm set values on the command line (can be repeated to set several values: --helm-set key1=val1 --helm-set key2=val2)]:' \
    '*--helm-set-file[Helm set values from respective files specified via the command line (can be repeated to set several values: --helm-set-file key1=path1 --helm-set-file key2=path2)]:' \
    '*--helm-set-string[Helm set STRING values on the command line (can be repeated to set several values: --helm-set-string key1=val1 --helm-set-string key2=val2)]:' \
    '*--jsonnet-ext-var-code[Jsonnet ext var]:' \
    '*--jsonnet-ext-var-str[Jsonnet string ext var]:' \
    '*--jsonnet-libs[Additional jsonnet libs (prefixed by repoRoot)]:' \
    '*--jsonnet-tla-code[Jsonnet top level code arguments]:' \
    '*--jsonnet-tla-str[Jsonnet top level string arguments]:' \
    '*--kustomize-image[Kustomize images (e.g. --kustomize-image node:8.15.0 --kustomize-image mysql=mariadb,alpine@sha256:24a0c4b4a4c0eb97a1aabb8e29f18e917d05abfe1b7a7c07857230879ce7d3d)]:' \
    '--kustomize-version[Kustomize version]:' \
    '(*-l *--label)'{\*-l,\*--label}'[Labels to apply to the app]:' \
    '--name[A name for the app, ignored if a file is set (DEPRECATED)]:' \
    '--nameprefix[Kustomize nameprefix]:' \
    '--namesuffix[Kustomize namesuffix]:' \
    '(*-p *--parameter)'{\*-p,\*--parameter}'[set a parameter override (e.g. -p guestbook=image=example/guestbook:latest)]:' \
    '--path[Path in repository to the app directory, ignored if a file is set]:' \
    '--project[Application project name]:' \
    '--release-name[Helm release-name]:' \
    '--repo[Repository URL, ignored if a file is set]:' \
    '--revision[The tracking source branch, tag, commit or Helm chart version the application will sync to]:' \
    '--revision-history-limit[How many items to keep in revision history]:' \
    '--self-heal[Set self healing when sync is automated]' \
    '*--sync-option[Add or remove a sync options, e.g add `Prune=false`. Remove using `!` prefix, e.g. `!Prune=false`]:' \
    '--sync-policy[Set the sync policy (one of: none, automated (aliases of automated: auto, automatic))]:' \
    '--upsert[Allows to override application with the same name even if supplied application spec is different from existing spec]' \
    '--validate[Validation of repo and cluster]' \
    '*--values[Helm values file(s) to use]:' \
    '--values-literal-file[Filename or URL to import as a literal Helm values block]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_delete {
  _arguments \
    '--cascade[Perform a cascaded deletion of all application resources]' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_diff {
  _arguments \
    '--hard-refresh[Refresh application data as well as target manifests cache]' \
    '--local[Compare live app to a local manifests]:' \
    '--local-repo-root[Path to the repository root. Used together with --local allows setting the repository root]:' \
    '--refresh[Refresh application data when retrieving]' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_edit {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_get {
  _arguments \
    '--hard-refresh[Refresh application data as well as target manifests cache]' \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide]:' \
    '--refresh[Refresh application data when retrieving]' \
    '--show-operation[Show application operation]' \
    '--show-params[Show application parameters and overrides]' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_history {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: wide|id]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_list {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: wide|name|json|yaml]:' \
    '(*-p *--project)'{\*-p,\*--project}'[Filter by project name]:' \
    '(-l --selector)'{-l,--selector}'[List apps by label]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_manifests {
  _arguments \
    '--revision[Show manifests at a specific revision]:' \
    '--source[Source of manifests. One of: live|git]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_patch {
  _arguments \
    '--patch[Patch body]:' \
    '--type[The type of patch being provided; one of [json merge]]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_patch-resource {
  _arguments \
    '--all[Indicates whether to patch multiple matching of resources]' \
    '--group[Group]:' \
    '--kind[Kind]:' \
    '--namespace[Namespace]:' \
    '--patch[Patch]:' \
    '--patch-type[Which Patching strategy to use: '\''application/json-patch+json'\'', '\''application/merge-patch+json'\'', or '\''application/strategic-merge-patch+json'\''. Defaults to '\''application/merge-patch+json'\'']:' \
    '--resource-name[Name of resource]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_resources {
  _arguments \
    '--orphaned[Lists only orphaned resources]' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_rollback {
  _arguments \
    '--prune[Allow deleting unexpected resources]' \
    '--timeout[Time out after this many seconds]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_set {
  _arguments \
    '--auto-prune[Set automatic pruning when sync is automated]' \
    '--config-management-plugin[Config management plugin name]:' \
    '--dest-name[K8s cluster Name (e.g. minikube)]:' \
    '--dest-namespace[K8s target namespace (overrides the namespace specified in the ksonnet app.yaml)]:' \
    '--dest-server[K8s cluster URL (e.g. https://kubernetes.default.svc)]:' \
    '--directory-recurse[Recurse directory]' \
    '--env[Application environment to monitor]:' \
    '--helm-chart[Helm Chart name]:' \
    '*--helm-set[Helm set values on the command line (can be repeated to set several values: --helm-set key1=val1 --helm-set key2=val2)]:' \
    '*--helm-set-file[Helm set values from respective files specified via the command line (can be repeated to set several values: --helm-set-file key1=path1 --helm-set-file key2=path2)]:' \
    '*--helm-set-string[Helm set STRING values on the command line (can be repeated to set several values: --helm-set-string key1=val1 --helm-set-string key2=val2)]:' \
    '*--jsonnet-ext-var-code[Jsonnet ext var]:' \
    '*--jsonnet-ext-var-str[Jsonnet string ext var]:' \
    '*--jsonnet-libs[Additional jsonnet libs (prefixed by repoRoot)]:' \
    '*--jsonnet-tla-code[Jsonnet top level code arguments]:' \
    '*--jsonnet-tla-str[Jsonnet top level string arguments]:' \
    '*--kustomize-image[Kustomize images (e.g. --kustomize-image node:8.15.0 --kustomize-image mysql=mariadb,alpine@sha256:24a0c4b4a4c0eb97a1aabb8e29f18e917d05abfe1b7a7c07857230879ce7d3d)]:' \
    '--kustomize-version[Kustomize version]:' \
    '--nameprefix[Kustomize nameprefix]:' \
    '--namesuffix[Kustomize namesuffix]:' \
    '(*-p *--parameter)'{\*-p,\*--parameter}'[set a parameter override (e.g. -p guestbook=image=example/guestbook:latest)]:' \
    '--path[Path in repository to the app directory, ignored if a file is set]:' \
    '--project[Application project name]:' \
    '--release-name[Helm release-name]:' \
    '--repo[Repository URL, ignored if a file is set]:' \
    '--revision[The tracking source branch, tag, commit or Helm chart version the application will sync to]:' \
    '--revision-history-limit[How many items to keep in revision history]:' \
    '--self-heal[Set self healing when sync is automated]' \
    '*--sync-option[Add or remove a sync options, e.g add `Prune=false`. Remove using `!` prefix, e.g. `!Prune=false`]:' \
    '--sync-policy[Set the sync policy (one of: none, automated (aliases of automated: auto, automatic))]:' \
    '--validate[Validation of repo and cluster]' \
    '*--values[Helm values file(s) to use]:' \
    '--values-literal-file[Filename or URL to import as a literal Helm values block]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_sync {
  _arguments \
    '--async[Do not wait for application to sync before continuing]' \
    '--dry-run[Preview apply without affecting cluster]' \
    '--force[Use a force apply]' \
    '*--info[A list of key-value pairs during sync process. These infos will be persisted in app.]:' \
    '*--label[Sync only specific resources with a label. This option may be specified repeatedly.]:' \
    '--local[Path to a local directory. When this flag is present no git queries will be made]:' \
    '--local-repo-root[Path to the repository root. Used together with --local allows setting the repository root]:' \
    '--prune[Allow deleting unexpected resources]' \
    '*--resource[Sync only specific resources as GROUP:KIND:NAME. Fields may be blank. This option may be specified repeatedly]:' \
    '--retry-backoff-duration[Retry backoff base duration. Default unit is seconds, but could also be a duration (e.g. 2m, 1h)]:' \
    '--retry-backoff-factor[Factor multiplies the base duration after each failed retry]:' \
    '--retry-backoff-max-duration[Max retry backoff duration. Default unit is seconds, but could also be a duration (e.g. 2m, 1h)]:' \
    '--retry-limit[Max number of allowed sync retries]:' \
    '--revision[Sync to a specific revision. Preserves parameter overrides]:' \
    '(-l --selector)'{-l,--selector}'[Sync apps that match this label]:' \
    '--strategy[Sync strategy (one of: apply|hook)]:' \
    '--timeout[Time out after this many seconds]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_terminate-op {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_unset {
  _arguments \
    '*--kustomize-image[Kustomize images name (e.g. --kustomize-image node --kustomize-image mysql)]:' \
    '--kustomize-version[Kustomize version]' \
    '--nameprefix[Kustomize nameprefix]' \
    '--namesuffix[Kustomize namesuffix]' \
    '(*-p *--parameter)'{\*-p,\*--parameter}'[Unset a parameter override (e.g. -p guestbook=image)]:' \
    '*--values[Unset one or more Helm values files]:' \
    '--values-literal[Unset literal Helm values block]' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_app_wait {
  _arguments \
    '--health[Wait for health]' \
    '--operation[Wait for pending operations]' \
    '*--resource[Sync only specific resources as GROUP:KIND:NAME. Fields may be blank. This option may be specified repeatedly]:' \
    '(-l --selector)'{-l,--selector}'[Wait for apps by label]:' \
    '--suspended[Wait for suspended]' \
    '--sync[Wait for sync]' \
    '--timeout[Time out after this many seconds]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}


function _argocd_cert {
  local -a commands

  _arguments -C \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "add-ssh:Add SSH known host entries for repository servers"
      "add-tls:Add TLS certificate data for connecting to repository server SERVERNAME"
      "list:List configured certificates"
      "rm:Remove certificate of TYPE for REPOSERVER"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  add-ssh)
    _argocd_cert_add-ssh
    ;;
  add-tls)
    _argocd_cert_add-tls
    ;;
  list)
    _argocd_cert_list
    ;;
  rm)
    _argocd_cert_rm
    ;;
  esac
}

function _argocd_cert_add-ssh {
  _arguments \
    '--batch[Perform batch processing by reading in SSH known hosts data (mandatory flag)]' \
    '--from[Read SSH known hosts data from file (default is to read from stdin)]:' \
    '--upsert[Replace existing SSH server public host keys if key is different in input]' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_cert_add-tls {
  _arguments \
    '--from[read TLS certificate data from file (default is to read from stdin)]:' \
    '--upsert[Replace existing TLS certificate if certificate is different in input]' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_cert_list {
  _arguments \
    '--cert-type[only list certificates of given type, valid: '\''ssh'\'','\''https'\'']:' \
    '--hostname-pattern[only list certificates for hosts matching given glob-pattern]:' \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide]:' \
    '--sort[set display sort order for output format wide. One of: hostname|type]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_cert_rm {
  _arguments \
    '--cert-sub-type[Only remove certs of given sub-type (only for ssh)]:' \
    '--cert-type[Only remove certs of given type (ssh, https)]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}


function _argocd_cluster {
  local -a commands

  _arguments -C \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "add:argocd cluster add CONTEXT"
      "get:Get cluster information"
      "list:List configured clusters"
      "rm:Remove cluster credentials"
      "rotate-auth:argocd cluster rotate-auth SERVER"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  add)
    _argocd_cluster_add
    ;;
  get)
    _argocd_cluster_get
    ;;
  list)
    _argocd_cluster_list
    ;;
  rm)
    _argocd_cluster_rm
    ;;
  rotate-auth)
    _argocd_cluster_rotate-auth
    ;;
  esac
}

function _argocd_cluster_add {
  _arguments \
    '--aws-cluster-name[AWS Cluster name if set then aws cli eks token command will be used to access cluster]:' \
    '--aws-role-arn[Optional AWS role arn. If set then AWS IAM Authenticator assume a role to perform cluster operations instead of the default AWS credential provider chain.]:' \
    '--in-cluster[Indicates Argo CD resides inside this cluster and should connect using the internal k8s hostname (kubernetes.default.svc)]' \
    '--kubeconfig[use a particular kubeconfig file]:' \
    '--name[Overwrite the cluster name]:' \
    '*--namespace[List of namespaces which are allowed to manage]:' \
    '--service-account[System namespace service account to use for kubernetes resource management. If not set then default "argocd-manager" SA will be created]:' \
    '--system-namespace[Use different system namespace]:' \
    '--upsert[Override an existing cluster with the same name even if the spec differs]' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_cluster_get {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide|server]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_cluster_list {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide|server]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_cluster_rm {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_cluster_rotate-auth {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_completion {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_context {
  _arguments \
    '--delete[Delete the context instead of switching to it]' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}


function _argocd_gpg {
  local -a commands

  _arguments -C \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "add:Adds a GPG public key to the server's keyring"
      "get:Get the GPG public key with ID <KEYID> from the server"
      "list:List configured GPG public keys"
      "rm:Removes a GPG public key from the server's keyring"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  add)
    _argocd_gpg_add
    ;;
  get)
    _argocd_gpg_get
    ;;
  list)
    _argocd_gpg_list
    ;;
  rm)
    _argocd_gpg_rm
    ;;
  esac
}

function _argocd_gpg_add {
  _arguments \
    '(-f --from)'{-f,--from}'[Path to the file that contains the GPG public key to import]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_gpg_get {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_gpg_list {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_gpg_rm {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_login {
  _arguments \
    '--name[name to use for the context]:' \
    '--password[the password of an account to authenticate]:' \
    '--sso[perform SSO login]' \
    '--sso-port[port to run local OAuth2 login application]:' \
    '--username[the username of an account to authenticate]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_logout {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}


function _argocd_proj {
  local -a commands

  _arguments -C \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "add-destination:Add project destination"
      "add-orphaned-ignore:Add a resource to orphaned ignore list"
      "add-signature-key:Add GnuPG signature key to project"
      "add-source:Add project source repository"
      "allow-cluster-resource:Adds a cluster-scoped API resource to the whitelist and removes it from blacklist"
      "allow-namespace-resource:Removes a namespaced API resource from the blacklist or add a namespaced API resource to the whitelist"
      "create:Create a project"
      "delete:Delete project"
      "deny-cluster-resource:Removes a cluster-scoped API resource from the whitelist and adds it to blacklist"
      "deny-namespace-resource:Adds a namespaced API resource to the blacklist or removes a namespaced API resource from the whitelist"
      "edit:Edit project"
      "get:Get project details"
      "list:List projects"
      "remove-destination:Remove project destination"
      "remove-orphaned-ignore:Remove a resource from orphaned ignore list"
      "remove-signature-key:Remove GnuPG signature key from project"
      "remove-source:Remove project source repository"
      "role:Manage a project's roles"
      "set:Set project parameters"
      "windows:Manage a project's sync windows"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  add-destination)
    _argocd_proj_add-destination
    ;;
  add-orphaned-ignore)
    _argocd_proj_add-orphaned-ignore
    ;;
  add-signature-key)
    _argocd_proj_add-signature-key
    ;;
  add-source)
    _argocd_proj_add-source
    ;;
  allow-cluster-resource)
    _argocd_proj_allow-cluster-resource
    ;;
  allow-namespace-resource)
    _argocd_proj_allow-namespace-resource
    ;;
  create)
    _argocd_proj_create
    ;;
  delete)
    _argocd_proj_delete
    ;;
  deny-cluster-resource)
    _argocd_proj_deny-cluster-resource
    ;;
  deny-namespace-resource)
    _argocd_proj_deny-namespace-resource
    ;;
  edit)
    _argocd_proj_edit
    ;;
  get)
    _argocd_proj_get
    ;;
  list)
    _argocd_proj_list
    ;;
  remove-destination)
    _argocd_proj_remove-destination
    ;;
  remove-orphaned-ignore)
    _argocd_proj_remove-orphaned-ignore
    ;;
  remove-signature-key)
    _argocd_proj_remove-signature-key
    ;;
  remove-source)
    _argocd_proj_remove-source
    ;;
  role)
    _argocd_proj_role
    ;;
  set)
    _argocd_proj_set
    ;;
  windows)
    _argocd_proj_windows
    ;;
  esac
}

function _argocd_proj_add-destination {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_add-orphaned-ignore {
  _arguments \
    '--name[Resource name pattern]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_add-signature-key {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_add-source {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_allow-cluster-resource {
  _arguments \
    '(-l --list)'{-l,--list}'[Use blacklist or whitelist. This can only be '\''white'\'' or '\''black'\'']:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_allow-namespace-resource {
  _arguments \
    '(-l --list)'{-l,--list}'[Use blacklist or whitelist. This can only be '\''white'\'' or '\''black'\'']:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_create {
  _arguments \
    '--description[Project description]:' \
    '(*-d *--dest)'{\*-d,\*--dest}'[Permitted destination server and namespace (e.g. https://192.168.99.100:8443,default)]:' \
    '(-f --file)'{-f,--file}'[Filename or URL to Kubernetes manifests for the project]:filename:_files -g "json" -g "yaml" -g "yml"' \
    '--orphaned-resources[Enables orphaned resources monitoring]' \
    '--orphaned-resources-warn[Specifies if applications should be a warning condition when orphaned resources detected]' \
    '*--signature-keys[GnuPG public key IDs for commit signature verification]:' \
    '(*-s *--src)'{\*-s,\*--src}'[Permitted source repository URL]:' \
    '--upsert[Allows to override a project with the same name even if supplied project spec is different from existing spec]' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_delete {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_deny-cluster-resource {
  _arguments \
    '(-l --list)'{-l,--list}'[Use blacklist or whitelist. This can only be '\''white'\'' or '\''black'\'']:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_deny-namespace-resource {
  _arguments \
    '(-l --list)'{-l,--list}'[Use blacklist or whitelist. This can only be '\''white'\'' or '\''black'\'']:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_edit {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_get {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_list {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide|name]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_remove-destination {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_remove-orphaned-ignore {
  _arguments \
    '--name[Resource name pattern]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_remove-signature-key {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_remove-source {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}


function _argocd_proj_role {
  local -a commands

  _arguments -C \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "add-group:Add a group claim to a project role"
      "add-policy:Add a policy to a project role"
      "create:Create a project role"
      "create-token:Create a project token"
      "delete:Delete a project role"
      "delete-token:Delete a project token"
      "get:Get the details of a specific role"
      "list:List all the roles in a project"
      "remove-group:Remove a group claim from a role within a project"
      "remove-policy:Remove a policy from a role within a project"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  add-group)
    _argocd_proj_role_add-group
    ;;
  add-policy)
    _argocd_proj_role_add-policy
    ;;
  create)
    _argocd_proj_role_create
    ;;
  create-token)
    _argocd_proj_role_create-token
    ;;
  delete)
    _argocd_proj_role_delete
    ;;
  delete-token)
    _argocd_proj_role_delete-token
    ;;
  get)
    _argocd_proj_role_get
    ;;
  list)
    _argocd_proj_role_list
    ;;
  remove-group)
    _argocd_proj_role_remove-group
    ;;
  remove-policy)
    _argocd_proj_role_remove-policy
    ;;
  esac
}

function _argocd_proj_role_add-group {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_role_add-policy {
  _arguments \
    '(-a --action)'{-a,--action}'[Action to grant/deny permission on (e.g. get, create, list, update, delete)]:' \
    '(-o --object)'{-o,--object}'[Object within the project to grant/deny access.  Use '\''*'\'' for a wildcard. Will want access to '\''<project>/<object>'\'']:' \
    '(-p --permission)'{-p,--permission}'[Whether to allow or deny access to object with the action.  This can only be '\''allow'\'' or '\''deny'\'']:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_role_create {
  _arguments \
    '--description[Project description]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_role_create-token {
  _arguments \
    '(-e --expires-in)'{-e,--expires-in}'[Duration before the token will expire. (Default: No expiration)]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_role_delete {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_role_delete-token {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_role_get {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_role_list {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide|name]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_role_remove-group {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_role_remove-policy {
  _arguments \
    '(-a --action)'{-a,--action}'[Action to grant/deny permission on (e.g. get, create, list, update, delete)]:' \
    '(-o --object)'{-o,--object}'[Object within the project to grant/deny access.  Use '\''*'\'' for a wildcard. Will want access to '\''<project>/<object>'\'']:' \
    '(-p --permission)'{-p,--permission}'[Whether to allow or deny access to object with the action.  This can only be '\''allow'\'' or '\''deny'\'']:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_set {
  _arguments \
    '--description[Project description]:' \
    '(*-d *--dest)'{\*-d,\*--dest}'[Permitted destination server and namespace (e.g. https://192.168.99.100:8443,default)]:' \
    '--orphaned-resources[Enables orphaned resources monitoring]' \
    '--orphaned-resources-warn[Specifies if applications should be a warning condition when orphaned resources detected]' \
    '*--signature-keys[GnuPG public key IDs for commit signature verification]:' \
    '(*-s *--src)'{\*-s,\*--src}'[Permitted source repository URL]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}


function _argocd_proj_windows {
  local -a commands

  _arguments -C \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "add:Add a sync window to a project"
      "delete:Delete a sync window from a project. Requires ID which can be found by running "argocd proj windows list PROJECT""
      "disable-manual-sync:Disable manual sync for a sync window"
      "enable-manual-sync:Enable manual sync for a sync window"
      "list:List project sync windows"
      "update:Update a project sync window"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  add)
    _argocd_proj_windows_add
    ;;
  delete)
    _argocd_proj_windows_delete
    ;;
  disable-manual-sync)
    _argocd_proj_windows_disable-manual-sync
    ;;
  enable-manual-sync)
    _argocd_proj_windows_enable-manual-sync
    ;;
  list)
    _argocd_proj_windows_list
    ;;
  update)
    _argocd_proj_windows_update
    ;;
  esac
}

function _argocd_proj_windows_add {
  _arguments \
    '*--applications[Applications that the schedule will be applied to. Comma separated, wildcards supported (e.g. --applications prod-\*,website)]:' \
    '*--clusters[Clusters that the schedule will be applied to. Comma separated, wildcards supported (e.g. --clusters prod,staging)]:' \
    '--duration[Sync window duration. (e.g. --duration 1h)]:' \
    '(-k --kind)'{-k,--kind}'[Sync window kind, either allow or deny]:' \
    '--manual-sync[Allow manual syncs for both deny and allow windows]' \
    '*--namespaces[Namespaces that the schedule will be applied to. Comma separated, wildcards supported (e.g. --namespaces default,\*-prod)]:' \
    '--schedule[Sync window schedule in cron format. (e.g. --schedule "0 22 * * *")]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_windows_delete {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_windows_disable-manual-sync {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_windows_enable-manual-sync {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_windows_list {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_proj_windows_update {
  _arguments \
    '*--applications[Applications that the schedule will be applied to. Comma separated, wildcards supported (e.g. --applications prod-\*,website)]:' \
    '*--clusters[Clusters that the schedule will be applied to. Comma separated, wildcards supported (e.g. --clusters prod,staging)]:' \
    '--duration[Sync window duration. (e.g. --duration 1h)]:' \
    '*--namespaces[Namespaces that the schedule will be applied to. Comma separated, wildcards supported (e.g. --namespaces default,\*-prod)]:' \
    '--schedule[Sync window schedule in cron format. (e.g. --schedule "0 22 * * *")]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_relogin {
  _arguments \
    '--password[the password of an account to authenticate]:' \
    '--sso-port[port to run local OAuth2 login application]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}


function _argocd_repo {
  local -a commands

  _arguments -C \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "add:Add git repository connection parameters"
      "get:Get a configured repository by URL"
      "list:List configured repositories"
      "rm:Remove repository credentials"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  add)
    _argocd_repo_add
    ;;
  get)
    _argocd_repo_get
    ;;
  list)
    _argocd_repo_list
    ;;
  rm)
    _argocd_repo_rm
    ;;
  esac
}

function _argocd_repo_add {
  _arguments \
    '--enable-lfs[enable git-lfs (Large File Support) on this repository]' \
    '--insecure-ignore-host-key[disables SSH strict host key checking (deprecated, use --insecure-skip-server-verification instead)]' \
    '--insecure-skip-server-verification[disables server certificate and host key checks]' \
    '--name[name of the repository, mandatory for repositories of type helm]:' \
    '--password[password to the repository]:' \
    '--ssh-private-key-path[path to the private ssh key (e.g. ~/.ssh/id_rsa)]:' \
    '--tls-client-cert-key-path[path to the TLS client cert'\''s key path (must be PEM format)]:' \
    '--tls-client-cert-path[path to the TLS client cert (must be PEM format)]:' \
    '--type[type of the repository, "git" or "helm"]:' \
    '--upsert[Override an existing repository with the same name even if the spec differs]' \
    '--username[username to the repository]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_repo_get {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide|url]:' \
    '--refresh[Force a cache refresh on connection status]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_repo_list {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide|url]:' \
    '--refresh[Force a cache refresh on connection status]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_repo_rm {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}


function _argocd_repocreds {
  local -a commands

  _arguments -C \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "add:Add git repository connection parameters"
      "list:List configured repository credentials"
      "rm:Remove repository credentials"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  add)
    _argocd_repocreds_add
    ;;
  list)
    _argocd_repocreds_list
    ;;
  rm)
    _argocd_repocreds_rm
    ;;
  esac
}

function _argocd_repocreds_add {
  _arguments \
    '--password[password to the repository]:' \
    '--ssh-private-key-path[path to the private ssh key (e.g. ~/.ssh/id_rsa)]:' \
    '--tls-client-cert-key-path[path to the TLS client cert'\''s key path (must be PEM format)]:' \
    '--tls-client-cert-path[path to the TLS client cert (must be PEM format)]:' \
    '--upsert[Override an existing repository with the same name even if the spec differs]' \
    '--username[username to the repository]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_repocreds_list {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide|url]:' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_repocreds_rm {
  _arguments \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

function _argocd_version {
  _arguments \
    '--client[client version only (no server required)]' \
    '(-o --output)'{-o,--output}'[Output format. One of: json|yaml|wide|short]:' \
    '--short[print just the version number]' \
    '--auth-token[Authentication token]:' \
    '--client-crt[Client certificate file]:' \
    '--client-crt-key[Client certificate key file]:' \
    '--config[Path to Argo CD config]:' \
    '--grpc-web[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.]' \
    '--grpc-web-root-path[Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.]:' \
    '(*-H *--header)'{\*-H,\*--header}'[Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)]:' \
    '--insecure[Skip server certificate and domain verification]' \
    '--logformat[Set the logging format. One of: text|json]:' \
    '--loglevel[Set the logging level. One of: debug|info|warn|error]:' \
    '--plaintext[Disable TLS]' \
    '--port-forward[Connect to a random argocd-server port using port forwarding]' \
    '--port-forward-namespace[Namespace name which should be used for port forwarding]:' \
    '--server[Argo CD server address]:' \
    '--server-crt[Server certificate file]:'
}

