helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.14.3 \
  --set installCRDs=true

# Create secret in cert-manager
KEY=$(cat ca/papichulo.key | base64 -b0)
CRT=$(cat ca/papichulo.crt | base64 -b0)

cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: Secret
metadata:
 name: internal-ca
 namespace: cert-manager
data:
 tls.crt: ${CRT}
 tls.key: ${KEY}
EOF

cat << EOF | kubectl apply -f -
---
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: ca-issuer
  namespace: cert-manager
spec:
  ca:
    secretName: internal-ca
EOF

kubectl get clusterissuer -o wide
