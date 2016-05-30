FROM mongo

COPY cities.csv /tmp/cities.csv
CMD mongoimport --host db -d memayor -c City --type csv --file /tmp/cities.csv --headerline