#!/bin/bash

# This script ensures proper initialization of n8n on Render.com

# Make sure the data directory exists and has proper permissions
mkdir -p /home/node/.n8n
chown -R node:node /home/node/.n8n

# Start n8n
exec n8n start