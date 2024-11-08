# Use an appropriate Node.js version (18-alpine)
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the backend files
COPY . .

# Copy the .env file into the container (important)
COPY .env .env

# Expose the port defined in the .env file (default to 5000 if not provided)
EXPOSE ${PORT:-5000}

# Start the application
CMD ["npm", "start"]

