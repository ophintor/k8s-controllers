# Source: https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development/

# Create key and cert
openssl req  -nodes -new -x509  -keyout papichulo.key -out papichulo.crt

# Make it trusted for all users in the mac
sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" papichulo.crt
