# Use an appropriate Node.js base image
FROM mcr.microsoft.com/devcontainers/python:3.10

# Install Node.js
RUN apt update
RUN apt install nodejs npm -y

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if it exists)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port your Express app listens on
EXPOSE 3000

# Start the Express app
CMD ["npm", "start"]

