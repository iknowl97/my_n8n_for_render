FROM docker.n8n.io/n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Copy environment variables and startup script
COPY .env /home/node/.n8n/.env
COPY start.sh /home/node/start.sh

# Make startup script executable
RUN chmod +x /home/node/start.sh

# Ensure data persistence
VOLUME /home/node/.n8n

# Expose the port n8n runs on
EXPOSE 5678

# Start n8n using the startup script
CMD ["/home/node/start.sh"]