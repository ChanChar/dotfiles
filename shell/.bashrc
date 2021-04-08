# Bash is no longer the default in MacOS.
# Keep this file in case external packages write to this file instead of .zshrc
# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/charleschanlee/.kube/config:/Users/charleschanlee/.kube/config.shopify.cloudplatform
