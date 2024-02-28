helm upgrade \
    --install kube-prometheus-stack  \
    prometheus-community/kube-prometheus-stack\
    --namespace monitoring \
    --create-namespace \
    --values kube-prometheus-stack-values.yaml
