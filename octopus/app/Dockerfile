FROM python:3.7

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY octopus_to_influxdb.py ./
COPY octograph.ini ./

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT [ "python", "./octopus_to_influxdb.py" ]
