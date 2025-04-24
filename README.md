# n8n on Render.com

## Deployment Guide

This repository contains a configured setup for deploying n8n workflow automation tool on Render.com using Docker with persistent storage.

### Features

- Configured for domain: n8n.testdomain.com
- Persistent data storage even after restarts
- Environment variables consolidated in .env file
- PostgreSQL database integration
- Automatic updates with Watchtower

### Deployment Steps

1. **Fork or Clone this Repository**

   - Use this repository as a Blueprint in your Render.com dashboard

2. **Set Up on Render.com**

   - Go to your Render Dashboard
   - Create a new Web Service using this repository
   - Select "Blueprint" as the deployment method
   - Render will automatically detect the `render.yaml` configuration

3. **Environment Variables**

   - The necessary environment variables are already configured in the `render.yaml` file
   - For additional customization, you can add more variables in the Render dashboard

4. **Database**

   - A PostgreSQL database will be automatically provisioned as specified in `render.yaml`
   - Database credentials will be automatically linked to your n8n instance

5. **Persistent Storage**
   - The configuration includes a 10GB disk mounted at `/home/node/.n8n`
   - All your workflows and data will persist even if the service restarts

### Important Notes

- The default mountPath in the `render.yaml` file is set to `/home/node/.n8n` - do not change this or n8n won't save data correctly
- To change the webhook URL from the default domain, update the `WEBHOOK_URL` in the environment variables
- The n8n instance will be accessible at https://n8n.testdomain.com once deployed

### Local Development

To run this setup locally before deploying:

```bash
docker-compose up -d
```

This will start n8n with a PostgreSQL database and persistent storage.
