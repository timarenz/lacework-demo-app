#!/bin/sh

# Lacework Agent: configure and start the data collector
/var/lib/lacework-backup/lacework-sidecar.sh &

python3 /app/app.py