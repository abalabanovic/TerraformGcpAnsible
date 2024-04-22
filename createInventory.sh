#!/bin/bash

instance_ip=""

if [ -f inventory ]; then
	echo "File already exists"
	exit 1
fi
	

echo "[servers]" > inventory

for instance_name in $(gcloud compute instance-groups list-instances instance-group-manager\
  --zone us-central1-a \
  --format="value(NAME)"); do
 instance_ip=$(gcloud compute instances describe $instance_name \
    --zone us-central1-a \
    --format="value(networkInterfaces[0].accessConfigs[0].natIP)")
  echo "$instance_ip" >> inventory

#app1 ansible_host=0.0.0.0

done

echo "[local]" >> inventory
echo "control ansible_connection=local" >> inventory
