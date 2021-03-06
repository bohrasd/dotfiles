compdef _linkerd linkerd


function _linkerd {
  local -a commands

  _arguments -C \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "alpha:experimental subcommands for Linkerd"
      "check:Check the Linkerd installation for potential problems"
      "completion:Output shell completion code for the specified shell (bash or zsh)"
      "dashboard:Open the Linkerd dashboard in a web browser"
      "diagnostics:Fetch metrics directly from the Linkerd control plane containers"
      "edges:Display connections between resources, and Linkerd proxy identities"
      "endpoints:Introspect Linkerd's service discovery state"
      "get:Display one or many mesh resources"
      "help:Help about any command"
      "inject:Add the Linkerd proxy to a Kubernetes config"
      "install:Output Kubernetes configs to install Linkerd"
      "install-cni:Output Kubernetes configs to install Linkerd CNI"
      "install-sp:Output Kubernetes configs to install Linkerd Service Profiles"
      "logs:Tail logs from containers in the Linkerd control plane"
      "metrics:Fetch metrics directly from Linkerd proxies"
      "multicluster:Manages the multicluster setup for Linkerd"
      "profile:Output service profile config for Kubernetes"
      "routes:Display route stats"
      "stat:Display traffic stats about one or many resources"
      "tap:Listen to a traffic stream"
      "top:Display sorted information about live traffic"
      "uninject:Remove the Linkerd proxy from a Kubernetes config"
      "uninstall:Output Kubernetes resources to uninstall Linkerd control plane"
      "upgrade:Output Kubernetes configs to upgrade an existing Linkerd control plane"
      "version:Print the client and server version information"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  alpha)
    _linkerd_alpha
    ;;
  check)
    _linkerd_check
    ;;
  completion)
    _linkerd_completion
    ;;
  dashboard)
    _linkerd_dashboard
    ;;
  diagnostics)
    _linkerd_diagnostics
    ;;
  edges)
    _linkerd_edges
    ;;
  endpoints)
    _linkerd_endpoints
    ;;
  get)
    _linkerd_get
    ;;
  help)
    _linkerd_help
    ;;
  inject)
    _linkerd_inject
    ;;
  install)
    _linkerd_install
    ;;
  install-cni)
    _linkerd_install-cni
    ;;
  install-sp)
    _linkerd_install-sp
    ;;
  logs)
    _linkerd_logs
    ;;
  metrics)
    _linkerd_metrics
    ;;
  multicluster)
    _linkerd_multicluster
    ;;
  profile)
    _linkerd_profile
    ;;
  routes)
    _linkerd_routes
    ;;
  stat)
    _linkerd_stat
    ;;
  tap)
    _linkerd_tap
    ;;
  top)
    _linkerd_top
    ;;
  uninject)
    _linkerd_uninject
    ;;
  uninstall)
    _linkerd_uninstall
    ;;
  upgrade)
    _linkerd_upgrade
    ;;
  version)
    _linkerd_version
    ;;
  esac
}


function _linkerd_alpha {
  local -a commands

  _arguments -C \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "clients:Display client-side traffic stats to a resource."
      "stat:Display traffic stats about one or many resources"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  clients)
    _linkerd_alpha_clients
    ;;
  stat)
    _linkerd_alpha_stat
    ;;
  esac
}

function _linkerd_alpha_clients {
  _arguments \
    '(-n --namespace)'{-n,--namespace}'[Namespace of the specified resource]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_alpha_stat {
  _arguments \
    '(-A --all-namespaces)'{-A,--all-namespaces}'[Ignore the --namespace flag and fetches data from all namespaces]' \
    '(-n --namespace)'{-n,--namespace}'[Namespace of the specified resource]:' \
    '--to[If present, restricts outbound stats to the specified resource name]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}


function _linkerd_check {
  local -a commands

  _arguments -C \
    '--cli-version-override[Used to override the version of the cli (mostly for testing)]:' \
    '--expected-version[Overrides the version used when checking if Linkerd is running the latest version (mostly for testing)]:' \
    '--linkerd-cni-enabled[When running pre-installation checks (--pre), assume the linkerd-cni plugin is already installed, and a NET_ADMIN check is not needed]' \
    '--multicluster[Run multicluster checks]' \
    '(-n --namespace)'{-n,--namespace}'[Namespace to use for --proxy checks (default: all namespaces)]:' \
    '(-o --output)'{-o,--output}'[Output format. One of: basic, json]:' \
    '--pre[Only run pre-installation checks, to determine if the control plane can be installed]' \
    '--proxy[Only run data-plane checks, to determine if the data plane is healthy]' \
    '--wait[Maximum allowed time for all tests to pass]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "config:Check the Linkerd cluster-wide resources for potential problems"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  config)
    _linkerd_check_config
    ;;
  esac
}

function _linkerd_check_config {
  _arguments \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cli-version-override[Used to override the version of the cli (mostly for testing)]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--expected-version[Overrides the version used when checking if Linkerd is running the latest version (mostly for testing)]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '(-o --output)'{-o,--output}'[Output format. One of: basic, json]:' \
    '--verbose[Turn on debug logging]' \
    '--wait[Maximum allowed time for all tests to pass]:'
}

function _linkerd_completion {
  _arguments \
    '(-h --help)'{-h,--help}'[help for completion]' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    '1: :("bash" "zsh")'
}

function _linkerd_dashboard {
  _arguments \
    '--address[The address at which to serve requests]:' \
    '(-p --port)'{-p,--port}'[The local port on which to serve requests (when set to 0, a random port will be used)]:' \
    '--show[Open a dashboard in a browser or show URLs in the CLI (one of: linkerd, grafana, url)]:' \
    '--wait[Wait for dashboard to become available if it'\''s not available when the command is run]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_diagnostics {
  _arguments \
    '(-w --wait)'{-w,--wait}'[Time allowed to fetch diagnostics]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_edges {
  _arguments \
    '(-A --all-namespaces)'{-A,--all-namespaces}'[If present, returns edges across all namespaces, ignoring the "--namespace" flag]' \
    '(-n --namespace)'{-n,--namespace}'[Namespace of the specified resource]:' \
    '(-o --output)'{-o,--output}'[Output format; one of: "table" or "json" or "wide"]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    '1: :("authority" "cronjob" "daemonset" "deployment" "job" "namespace" "pod" "replicaset" "replicationcontroller" "statefulset")'
}

function _linkerd_endpoints {
  _arguments \
    '(-o --output)'{-o,--output}'[Output format; one of: "table" or "json"]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_get {
  _arguments \
    '(-A --all-namespaces)'{-A,--all-namespaces}'[If present, returns pods across all namespaces, ignoring the "--namespace" flag]' \
    '(-n --namespace)'{-n,--namespace}'[Namespace of pods]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    '1: :("pod")'
}

function _linkerd_help {
  _arguments \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_inject {
  _arguments \
    '--admin-port[Proxy port to serve metrics on]:' \
    '--close-wait-timeout[Sets nf_conntrack_tcp_timeout_close_wait]:' \
    '--control-port[Proxy port to use for control]:' \
    '--disable-identity[Disables resources from participating in TLS identity]' \
    '--disable-tap[Disables resources from being tapped]' \
    '--enable-debug-sidecar[Inject a debug sidecar for data plane debugging]' \
    '--enable-external-profiles[Enable service profiles for non-Kubernetes services]' \
    '--ignore-cluster[Ignore the current Kubernetes cluster when checking for existing cluster configuration (default false)]' \
    '--image-pull-policy[Docker image pull policy]:' \
    '--inbound-port[Proxy port to use for inbound traffic]:' \
    '--init-image[Linkerd init container image name]:' \
    '--init-image-version[Linkerd init container image version]:' \
    '--manual[Include the proxy sidecar container spec in the YAML output (the auto-injector won'\''t pick it up, so config annotations aren'\''t supported) (default false)]' \
    '--outbound-port[Proxy port to use for outbound traffic]:' \
    '--proxy-cpu-limit[Maximum amount of CPU units that the proxy sidecar can use]:' \
    '--proxy-cpu-request[Amount of CPU units that the proxy sidecar requests]:' \
    '--proxy-image[Linkerd proxy container image name]:' \
    '--proxy-log-level[Log level for the proxy]:' \
    '--proxy-memory-limit[Maximum amount of Memory that the proxy sidecar can use]:' \
    '--proxy-memory-request[Amount of Memory that the proxy sidecar requests]:' \
    '--proxy-uid[Run the proxy under this user ID]:' \
    '(-v --proxy-version)'{-v,--proxy-version}'[Tag to be used for the Linkerd proxy images]:' \
    '--registry[Docker registry to pull images from]:' \
    '*--require-identity-on-inbound-ports[Inbound ports on which the proxy should require identity]:' \
    '*--skip-inbound-ports[Ports and/or port ranges (inclusive) that should skip the proxy and send directly to the application]:' \
    '*--skip-outbound-ports[Outbound ports and/or port ranges (inclusive) that should skip the proxy]:' \
    '--trace-collector[Collector Service address for the proxies to send Trace Data]:' \
    '--trace-collector-svc-account[Service account associated with the Trace collector instance]:' \
    '--wait-before-exit-seconds[The period during which the proxy sidecar must stay alive while its pod is terminating. Must be smaller than terminationGracePeriodSeconds for the pod (default 0)]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}


function _linkerd_install {
  local -a commands

  _arguments -C \
    '--addon-config[A path to a configuration file of add-ons. If add-on config already exists, this new config gets merged with the existing one (unless --addon-overwrite is used)]:' \
    '--admin-port[Proxy port to serve metrics on]:' \
    '--cluster-domain[Set custom cluster domain]:' \
    '--control-port[Proxy port to use for control]:' \
    '--controller-log-level[Log level for the controller and web components]:' \
    '--controller-replicas[Replicas of the controller to deploy]:' \
    '--controller-uid[Run the control plane components under this user ID]:' \
    '--disable-h2-upgrade[Prevents the controller from instructing proxies to perform transparent HTTP/2 upgrading (default false)]' \
    '--disable-heartbeat[Disables the heartbeat cronjob (default false)]' \
    '--enable-external-profiles[Enable service profiles for non-Kubernetes services]' \
    '--ha[Enable HA deployment config for the control plane (default false)]' \
    '--identity-clock-skew-allowance[The amount of time to allow for clock skew within a Linkerd cluster]:' \
    '--identity-external-issuer[Whether to use an external identity issuer (default false)]' \
    '--identity-issuance-lifetime[The amount of time for which the Identity issuer should certify identity]:' \
    '--identity-issuer-certificate-file[A path to a PEM-encoded file containing the Linkerd Identity issuer certificate (generated by default)]:' \
    '--identity-issuer-key-file[A path to a PEM-encoded file containing the Linkerd Identity issuer private key (generated by default)]:' \
    '--identity-trust-anchors-file[A path to a PEM-encoded file containing Linkerd Identity trust anchors (generated by default)]:' \
    '--identity-trust-domain[Configures the name suffix used for identities.]:' \
    '--ignore-cluster[Ignore the current Kubernetes cluster when checking for existing cluster configuration (default false)]' \
    '--inbound-port[Proxy port to use for inbound traffic]:' \
    '--linkerd-cni-enabled[Omit the NET_ADMIN capability in the PSP and the proxy-init container when injecting the proxy; requires the linkerd-cni plugin to already be installed]' \
    '--omit-webhook-side-effects[Omit the sideEffects flag in the webhook manifests, This flag must be provided during install or upgrade for Kubernetes versions pre 1.12]' \
    '--outbound-port[Proxy port to use for outbound traffic]:' \
    '--prometheus-image[Custom Prometheus image name]:' \
    '--proxy-cpu-limit[Maximum amount of CPU units that the proxy sidecar can use]:' \
    '--proxy-cpu-request[Amount of CPU units that the proxy sidecar requests]:' \
    '--proxy-log-level[Log level for the proxy]:' \
    '--proxy-memory-limit[Maximum amount of Memory that the proxy sidecar can use]:' \
    '--proxy-memory-request[Amount of Memory that the proxy sidecar requests]:' \
    '--proxy-uid[Run the proxy under this user ID]:' \
    '--registry[Docker registry to pull images from]:' \
    '--restrict-dashboard-privileges[Restrict the Linkerd Dashboard'\''s default privileges to disallow Tap and Check]' \
    '*--skip-inbound-ports[Ports and/or port ranges (inclusive) that should skip the proxy and send directly to the application]:' \
    '*--skip-outbound-ports[Outbound ports and/or port ranges (inclusive) that should skip the proxy]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "config:Output Kubernetes cluster-wide resources to install Linkerd"
      "control-plane:Output Kubernetes control plane resources to install Linkerd"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  config)
    _linkerd_install_config
    ;;
  control-plane)
    _linkerd_install_control-plane
    ;;
  esac
}

function _linkerd_install_config {
  _arguments \
    '--addon-config[A path to a configuration file of add-ons. If add-on config already exists, this new config gets merged with the existing one (unless --addon-overwrite is used)]:' \
    '--linkerd-cni-enabled[Omit the NET_ADMIN capability in the PSP and the proxy-init container when injecting the proxy; requires the linkerd-cni plugin to already be installed]' \
    '--restrict-dashboard-privileges[Restrict the Linkerd Dashboard'\''s default privileges to disallow Tap and Check]' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--ignore-cluster[Ignore the current Kubernetes cluster when checking for existing cluster configuration (default false)]' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_install_control-plane {
  _arguments \
    '--addon-config[A path to a configuration file of add-ons. If add-on config already exists, this new config gets merged with the existing one (unless --addon-overwrite is used)]:' \
    '--admin-port[Proxy port to serve metrics on]:' \
    '--cluster-domain[Set custom cluster domain]:' \
    '--control-port[Proxy port to use for control]:' \
    '--controller-log-level[Log level for the controller and web components]:' \
    '--controller-replicas[Replicas of the controller to deploy]:' \
    '--controller-uid[Run the control plane components under this user ID]:' \
    '--disable-h2-upgrade[Prevents the controller from instructing proxies to perform transparent HTTP/2 upgrading (default false)]' \
    '--disable-heartbeat[Disables the heartbeat cronjob (default false)]' \
    '--enable-external-profiles[Enable service profiles for non-Kubernetes services]' \
    '--ha[Enable HA deployment config for the control plane (default false)]' \
    '--identity-clock-skew-allowance[The amount of time to allow for clock skew within a Linkerd cluster]:' \
    '--identity-external-issuer[Whether to use an external identity issuer (default false)]' \
    '--identity-issuance-lifetime[The amount of time for which the Identity issuer should certify identity]:' \
    '--identity-issuer-certificate-file[A path to a PEM-encoded file containing the Linkerd Identity issuer certificate (generated by default)]:' \
    '--identity-issuer-key-file[A path to a PEM-encoded file containing the Linkerd Identity issuer private key (generated by default)]:' \
    '--identity-trust-anchors-file[A path to a PEM-encoded file containing Linkerd Identity trust anchors (generated by default)]:' \
    '--identity-trust-domain[Configures the name suffix used for identities.]:' \
    '--inbound-port[Proxy port to use for inbound traffic]:' \
    '--linkerd-cni-enabled[Omit the NET_ADMIN capability in the PSP and the proxy-init container when injecting the proxy; requires the linkerd-cni plugin to already be installed]' \
    '--omit-webhook-side-effects[Omit the sideEffects flag in the webhook manifests, This flag must be provided during install or upgrade for Kubernetes versions pre 1.12]' \
    '--outbound-port[Proxy port to use for outbound traffic]:' \
    '--prometheus-image[Custom Prometheus image name]:' \
    '--proxy-cpu-limit[Maximum amount of CPU units that the proxy sidecar can use]:' \
    '--proxy-cpu-request[Amount of CPU units that the proxy sidecar requests]:' \
    '--proxy-log-level[Log level for the proxy]:' \
    '--proxy-memory-limit[Maximum amount of Memory that the proxy sidecar can use]:' \
    '--proxy-memory-request[Amount of Memory that the proxy sidecar requests]:' \
    '--proxy-uid[Run the proxy under this user ID]:' \
    '--registry[Docker registry to pull images from]:' \
    '--restrict-dashboard-privileges[Restrict the Linkerd Dashboard'\''s default privileges to disallow Tap and Check]' \
    '--skip-checks[Skip checks for namespace existence]' \
    '*--skip-inbound-ports[Ports and/or port ranges (inclusive) that should skip the proxy and send directly to the application]:' \
    '*--skip-outbound-ports[Outbound ports and/or port ranges (inclusive) that should skip the proxy]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--ignore-cluster[Ignore the current Kubernetes cluster when checking for existing cluster configuration (default false)]' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_install-cni {
  _arguments \
    '--admin-port[Proxy port to serve metrics on]:' \
    '--cni-image[Image for the cni-plugin]:' \
    '--cni-log-level[Log level for the cni-plugin]:' \
    '--control-port[Proxy port to use for control]:' \
    '--dest-cni-bin-dir[Directory on the host where the CNI plugin binaries reside]:' \
    '--dest-cni-net-dir[Directory on the host where the CNI configuration will be placed]:' \
    '--inbound-port[Proxy port to use for inbound traffic]:' \
    '(-v --linkerd-version)'{-v,--linkerd-version}'[Tag to be used for Linkerd images]:' \
    '--outbound-port[Proxy port to use for outbound traffic]:' \
    '--proxy-uid[Run the proxy under this user ID]:' \
    '*--redirect-ports[Ports to redirect to proxy, if no port is specified then ALL ports are redirected]:' \
    '--registry[Docker registry to pull images from]:' \
    '*--skip-inbound-ports[Ports and/or port ranges (inclusive) that should skip the proxy and send directly to the application]:' \
    '*--skip-outbound-ports[Outbound ports and/or port ranges (inclusive) that should skip the proxy]:' \
    '--use-wait-flag[Configures the CNI plugin to use the "-w" flag for the iptables command. (default false)]' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_install-sp {
  _arguments \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_logs {
  _arguments \
    '(-c --container)'{-c,--container}'[Tail logs from the specified container. Options are '\''public-api'\'', '\''destination'\'', '\''tap'\'', '\''prometheus'\'', '\''grafana'\'' or '\''linkerd-proxy'\'']:' \
    '--control-plane-component[Tail logs from the specified control plane component. Default value (empty string) causes this command to tail logs from all resources marked with the '\''linkerd.io/control-plane-component'\'' label selector]:' \
    '(-n --no-color)'{-n,--no-color}'[Disable colorized output]' \
    '(-s --since)'{-s,--since}'[Duration of how far back logs should be retrieved]:' \
    '--tail[Last number of log lines to show for a given container. -1 does not show previous log lines]:' \
    '(-t --timestamps)'{-t,--timestamps}'[Print timestamps for each given log line]' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_metrics {
  _arguments \
    '(-n --namespace)'{-n,--namespace}'[Namespace of resource]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}


function _linkerd_multicluster {
  local -a commands

  _arguments -C \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "allow:Outputs credential resources that allow service-mirror controllers to connect to this cluster"
      "export-service:Exposes a service to be mirrored"
      "gateways:Display stats information about the gateways in target clusters"
      "install:Output Kubernetes configs to install the Linkerd multicluster add-on"
      "link:Outputs a Kubernetes secret that allows a service mirror component to connect to this cluster"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  allow)
    _linkerd_multicluster_allow
    ;;
  export-service)
    _linkerd_multicluster_export-service
    ;;
  gateways)
    _linkerd_multicluster_gateways
    ;;
  install)
    _linkerd_multicluster_install
    ;;
  link)
    _linkerd_multicluster_link
    ;;
  esac
}

function _linkerd_multicluster_allow {
  _arguments \
    '--ignore-cluster[Ignore cluster configuration]' \
    '--namespace[The destination namespace for the service account.]:' \
    '--service-account-name[The name of the multicluster access service account]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_multicluster_export-service {
  _arguments \
    '--gateway-name[the name of the gateway]:' \
    '--gateway-namespace[the namespace of the gateway]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_multicluster_gateways {
  _arguments \
    '--cluster-name[the name of the target cluster]:' \
    '--gateway-namespace[the namespace in which the gateway resides on the target cluster]:' \
    '(-t --time-window)'{-t,--time-window}'[Time window (for example: "15s", "1m", "10m", "1h"). Needs to be at least 15s.]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_multicluster_install {
  _arguments \
    '--gateway[If the gateway component should be installed]' \
    '--gateway-port[The port on the gateway used for all incoming traffic]:' \
    '--gateway-probe-port[The liveness check port of the gateway]:' \
    '--gateway-probe-seconds[The interval at which the gateway will be checked for being alive in seconds]:' \
    '--log-level[Log level for the Multicluster components]:' \
    '--namespace[The namespace in which the multicluster add-on is to be installed. Must not be the control plane namespace. ]:' \
    '--registry[Docker registry to pull images from]:' \
    '--service-mirror[If the service-mirror component should be installed]' \
    '--service-mirror-credentials[Whether to install the service account which can be used by service mirror components in source clusters to discover exported servivces]' \
    '--service-mirror-retry-limit[The number of times a failed update from the target cluster is allowed to be retried]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_multicluster_link {
  _arguments \
    '--api-server-address[The api server address of the target cluster]:' \
    '--cluster-name[Cluster name]:' \
    '--namespace[The namespace for the service account]:' \
    '--service-account-name[The name of the service account associated with the credentials]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_profile {
  _arguments \
    '(-n --namespace)'{-n,--namespace}'[Namespace of the service]:' \
    '--open-api[Output a service profile based on the given OpenAPI spec file]:' \
    '--proto[Output a service profile based on the given Protobuf spec file]:' \
    '--tap[Output a service profile based on tap data for the given target resource]:' \
    '--tap-duration[Duration over which tap data is collected (for example: "10s", "1m", "10m")]:' \
    '--tap-route-limit[Max number of routes to add to the profile]:' \
    '--template[Output a service profile template]' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_routes {
  _arguments \
    '(-n --namespace)'{-n,--namespace}'[Namespace of the specified resource]:' \
    '(-o --output)'{-o,--output}'[Output format; one of: "table", "wide", or "json"]:' \
    '(-l --selector)'{-l,--selector}'[Selector (label query) to filter on, supports '\''='\'', '\''=='\'', and '\''!='\'']:' \
    '(-t --time-window)'{-t,--time-window}'[Stat window (for example: "10s", "1m", "10m", "1h")]:' \
    '--to[If present, shows outbound stats to the specified resource]:' \
    '--to-namespace[Sets the namespace used to lookup the "--to" resource; by default the current "--namespace" is used]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    '1: :("authority" "cronjob" "daemonset" "deployment" "job" "namespace" "pod" "replicaset" "replicationcontroller" "statefulset")'
}

function _linkerd_stat {
  _arguments \
    '(-A --all-namespaces)'{-A,--all-namespaces}'[If present, returns stats across all namespaces, ignoring the "--namespace" flag]' \
    '--from[If present, restricts outbound stats from the specified resource name]:' \
    '--from-namespace[Sets the namespace used from lookup the "--from" resource; by default the current "--namespace" is used]:' \
    '(-n --namespace)'{-n,--namespace}'[Namespace of the specified resource]:' \
    '(-o --output)'{-o,--output}'[Output format; one of: "table" or "json" or "wide"]:' \
    '(-l --selector)'{-l,--selector}'[Selector (label query) to filter on, supports '\''='\'', '\''=='\'', and '\''!='\'']:' \
    '(-t --time-window)'{-t,--time-window}'[Stat window (for example: "15s", "1m", "10m", "1h"). Needs to be at least 15s.]:' \
    '--to[If present, restricts outbound stats to the specified resource name]:' \
    '--to-namespace[Sets the namespace used to lookup the "--to" resource; by default the current "--namespace" is used]:' \
    '--unmeshed[If present, include unmeshed resources in the output]' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    '1: :("authority" "cronjob" "daemonset" "deployment" "job" "namespace" "pod" "replicaset" "replicationcontroller" "statefulset")'
}

function _linkerd_tap {
  _arguments \
    '--authority[Display requests with this :authority]:' \
    '--max-rps[Maximum requests per second to tap.]:' \
    '--method[Display requests with this HTTP method]:' \
    '(-n --namespace)'{-n,--namespace}'[Namespace of the specified resource]:' \
    '(-o --output)'{-o,--output}'[Output format. One of: "wide", "json"]:' \
    '--path[Display requests with paths that start with this prefix]:' \
    '--scheme[Display requests with this scheme]:' \
    '(-l --selector)'{-l,--selector}'[Selector (label query) to filter on, supports '\''='\'', '\''=='\'', and '\''!='\'']:' \
    '--to[Display requests to this resource]:' \
    '--to-namespace[Sets the namespace used to lookup the "--to" resource; by default the current "--namespace" is used]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    '1: :("authority" "cronjob" "daemonset" "deployment" "job" "namespace" "pod" "replicaset" "replicationcontroller" "statefulset")'
}

function _linkerd_top {
  _arguments \
    '--authority[Display requests with this :authority]:' \
    '--hide-sources[Hide the source column]' \
    '--max-rps[Maximum requests per second to tap.]:' \
    '--method[Display requests with this HTTP method]:' \
    '(-n --namespace)'{-n,--namespace}'[Namespace of the specified resource]:' \
    '--path[Display requests with paths that start with this prefix]:' \
    '--routes[Display data per route instead of per path]' \
    '--scheme[Display requests with this scheme]:' \
    '(-l --selector)'{-l,--selector}'[Selector (label query) to filter on, supports '\''='\'', '\''=='\'', and '\''!='\'']:' \
    '--to[Display requests to this resource]:' \
    '--to-namespace[Sets the namespace used to lookup the "--to" resource; by default the current "--namespace" is used]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    '1: :("authority" "cronjob" "daemonset" "deployment" "job" "namespace" "pod" "replicaset" "replicationcontroller" "statefulset")'
}

function _linkerd_uninject {
  _arguments \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_uninstall {
  _arguments \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}


function _linkerd_upgrade {
  local -a commands

  _arguments -C \
    '--addon-config[A path to a configuration file of add-ons. If add-on config already exists, this new config gets merged with the existing one (unless --addon-overwrite is used)]:' \
    '--addon-overwrite[Overwrite (instead of merge) existing add-ons config with file in --addon-config (or reset to defaults if no new config is passed)]' \
    '--admin-port[Proxy port to serve metrics on]:' \
    '--control-port[Proxy port to use for control]:' \
    '--controller-log-level[Log level for the controller and web components]:' \
    '--controller-replicas[Replicas of the controller to deploy]:' \
    '--controller-uid[Run the control plane components under this user ID]:' \
    '--disable-h2-upgrade[Prevents the controller from instructing proxies to perform transparent HTTP/2 upgrading (default false)]' \
    '--disable-heartbeat[Disables the heartbeat cronjob (default false)]' \
    '--enable-external-profiles[Enable service profiles for non-Kubernetes services]' \
    '--force[Force upgrade operation even when issuer certificate does not work with the trust anchors of all proxies]' \
    '--from-manifests[Read config from a Linkerd install YAML rather than from Kubernetes]:' \
    '--ha[Enable HA deployment config for the control plane (default false)]' \
    '--identity-clock-skew-allowance[The amount of time to allow for clock skew within a Linkerd cluster]:' \
    '--identity-issuance-lifetime[The amount of time for which the Identity issuer should certify identity]:' \
    '--identity-issuer-certificate-file[A path to a PEM-encoded file containing the Linkerd Identity issuer certificate (generated by default)]:' \
    '--identity-issuer-key-file[A path to a PEM-encoded file containing the Linkerd Identity issuer private key (generated by default)]:' \
    '--identity-trust-anchors-file[A path to a PEM-encoded file containing Linkerd Identity trust anchors (generated by default)]:' \
    '--inbound-port[Proxy port to use for inbound traffic]:' \
    '--linkerd-cni-enabled[Omit the NET_ADMIN capability in the PSP and the proxy-init container when injecting the proxy; requires the linkerd-cni plugin to already be installed]' \
    '--omit-webhook-side-effects[Omit the sideEffects flag in the webhook manifests, This flag must be provided during install or upgrade for Kubernetes versions pre 1.12]' \
    '--outbound-port[Proxy port to use for outbound traffic]:' \
    '--prometheus-image[Custom Prometheus image name]:' \
    '--proxy-cpu-limit[Maximum amount of CPU units that the proxy sidecar can use]:' \
    '--proxy-cpu-request[Amount of CPU units that the proxy sidecar requests]:' \
    '--proxy-log-level[Log level for the proxy]:' \
    '--proxy-memory-limit[Maximum amount of Memory that the proxy sidecar can use]:' \
    '--proxy-memory-request[Amount of Memory that the proxy sidecar requests]:' \
    '--proxy-uid[Run the proxy under this user ID]:' \
    '--registry[Docker registry to pull images from]:' \
    '--restrict-dashboard-privileges[Restrict the Linkerd Dashboard'\''s default privileges to disallow Tap and Check]' \
    '*--skip-inbound-ports[Ports and/or port ranges (inclusive) that should skip the proxy and send directly to the application]:' \
    '*--skip-outbound-ports[Outbound ports and/or port ranges (inclusive) that should skip the proxy]:' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "config:Output Kubernetes cluster-wide resources to upgrade an existing Linkerd"
      "control-plane:Output Kubernetes control plane resources to upgrade an existing Linkerd"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  config)
    _linkerd_upgrade_config
    ;;
  control-plane)
    _linkerd_upgrade_control-plane
    ;;
  esac
}

function _linkerd_upgrade_config {
  _arguments \
    '--addon-config[A path to a configuration file of add-ons. If add-on config already exists, this new config gets merged with the existing one (unless --addon-overwrite is used)]:' \
    '--linkerd-cni-enabled[Omit the NET_ADMIN capability in the PSP and the proxy-init container when injecting the proxy; requires the linkerd-cni plugin to already be installed]' \
    '--restrict-dashboard-privileges[Restrict the Linkerd Dashboard'\''s default privileges to disallow Tap and Check]' \
    '--addon-overwrite[Overwrite (instead of merge) existing add-ons config with file in --addon-config (or reset to defaults if no new config is passed)]' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--force[Force upgrade operation even when issuer certificate does not work with the trust anchors of all proxies]' \
    '--from-manifests[Read config from a Linkerd install YAML rather than from Kubernetes]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_upgrade_control-plane {
  _arguments \
    '--addon-config[A path to a configuration file of add-ons. If add-on config already exists, this new config gets merged with the existing one (unless --addon-overwrite is used)]:' \
    '--admin-port[Proxy port to serve metrics on]:' \
    '--control-port[Proxy port to use for control]:' \
    '--controller-log-level[Log level for the controller and web components]:' \
    '--controller-replicas[Replicas of the controller to deploy]:' \
    '--controller-uid[Run the control plane components under this user ID]:' \
    '--disable-h2-upgrade[Prevents the controller from instructing proxies to perform transparent HTTP/2 upgrading (default false)]' \
    '--disable-heartbeat[Disables the heartbeat cronjob (default false)]' \
    '--enable-external-profiles[Enable service profiles for non-Kubernetes services]' \
    '--ha[Enable HA deployment config for the control plane (default false)]' \
    '--identity-clock-skew-allowance[The amount of time to allow for clock skew within a Linkerd cluster]:' \
    '--identity-issuance-lifetime[The amount of time for which the Identity issuer should certify identity]:' \
    '--identity-issuer-certificate-file[A path to a PEM-encoded file containing the Linkerd Identity issuer certificate (generated by default)]:' \
    '--identity-issuer-key-file[A path to a PEM-encoded file containing the Linkerd Identity issuer private key (generated by default)]:' \
    '--identity-trust-anchors-file[A path to a PEM-encoded file containing Linkerd Identity trust anchors (generated by default)]:' \
    '--inbound-port[Proxy port to use for inbound traffic]:' \
    '--linkerd-cni-enabled[Omit the NET_ADMIN capability in the PSP and the proxy-init container when injecting the proxy; requires the linkerd-cni plugin to already be installed]' \
    '--omit-webhook-side-effects[Omit the sideEffects flag in the webhook manifests, This flag must be provided during install or upgrade for Kubernetes versions pre 1.12]' \
    '--outbound-port[Proxy port to use for outbound traffic]:' \
    '--prometheus-image[Custom Prometheus image name]:' \
    '--proxy-cpu-limit[Maximum amount of CPU units that the proxy sidecar can use]:' \
    '--proxy-cpu-request[Amount of CPU units that the proxy sidecar requests]:' \
    '--proxy-log-level[Log level for the proxy]:' \
    '--proxy-memory-limit[Maximum amount of Memory that the proxy sidecar can use]:' \
    '--proxy-memory-request[Amount of Memory that the proxy sidecar requests]:' \
    '--proxy-uid[Run the proxy under this user ID]:' \
    '--registry[Docker registry to pull images from]:' \
    '--restrict-dashboard-privileges[Restrict the Linkerd Dashboard'\''s default privileges to disallow Tap and Check]' \
    '*--skip-inbound-ports[Ports and/or port ranges (inclusive) that should skip the proxy and send directly to the application]:' \
    '*--skip-outbound-ports[Outbound ports and/or port ranges (inclusive) that should skip the proxy]:' \
    '--addon-overwrite[Overwrite (instead of merge) existing add-ons config with file in --addon-config (or reset to defaults if no new config is passed)]' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--force[Force upgrade operation even when issuer certificate does not work with the trust anchors of all proxies]' \
    '--from-manifests[Read config from a Linkerd install YAML rather than from Kubernetes]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

function _linkerd_version {
  _arguments \
    '--client[Print the client version only]' \
    '(-n --namespace)'{-n,--namespace}'[Namespace to use for --proxy versions (default: all namespaces)]:' \
    '--proxy[Print data-plane versions]' \
    '--short[Print the version number(s) only, with no additional output]' \
    '--api-addr[Override kubeconfig and communicate directly with the control plane at host:port (mostly for testing)]:' \
    '--as[Username to impersonate for Kubernetes operations]:' \
    '*--as-group[Group to impersonate for Kubernetes operations]:' \
    '--cni-namespace[Namespace in which the Linkerd CNI plugin is installed]:' \
    '--context[Name of the kubeconfig context to use]:' \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests]:' \
    '(-L --linkerd-namespace)'{-L,--linkerd-namespace}'[Namespace in which Linkerd is installed ]:' \
    '--verbose[Turn on debug logging]'
}

