FROM mongo

COPY cities.csv /tmp/cities.csv
CMD mongoimport --host mongo -d memayor -c city --type csv --file /tmp/cities.csv --headerline