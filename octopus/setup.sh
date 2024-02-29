# kubectl create secret generic influxdb-auth \
#     --from-literal=influxdb-user=admin \
#     --from-literal=influxdb-password=admin \
#     --namespace monitoring

# helm repo add influxdata https://helm.influxdata.com/
# helm upgrade \
#     --install influxdb influxdata/influxdb \
#     --namespace monitoring \
#     --create-namespace \
#     --values influxdb-values.yaml

docker build -t octopus-to-influxdb ./app

FROM_DATE='2023-01-01'
TO_DATE='2023-06-01'
docker run octopus-to-influxdb  \
    --from-date=$FROM_DATE \
    --to-date=$TO_DATE

FROM_DATE='2023-06-01'
TO_DATE='2024-01-01'
docker run octopus-to-influxdb  \
    --from-date=$FROM_DATE \
    --to-date=$TO_DATE
