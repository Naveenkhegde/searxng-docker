#!/bin/bash

# A script to run SearXNG on reboot via a cron job.

# Check if Docker daemon is running.
if [[ $(sudo systemctl is-active docker) != active ]]; then
  
  # If daemon isn't running, start it up.
  sudo systemctl start docker
  
fi

# (delay by 15 seconds to ensure needed services are running)
sleep 15s ; cd /home/searxng/searxng-docker ; /usr/bin/docker-compose up -d