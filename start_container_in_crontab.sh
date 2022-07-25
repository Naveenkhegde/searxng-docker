#!/bin/bash

# A script to run SearXNG on reboot via a cron job.

# Check if Docker daemon is running.
if [[ $(sudo systemctl is-active docker) != active ]]; then
  
  # If daemon isn't running, start it up.
  sudo systemctl start docker
  
fi

cd /home/searxng/searxng-docker ; sudo /usr/bin/docker-compose up -d