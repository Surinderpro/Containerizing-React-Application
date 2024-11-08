# Use Node.js base image (alpine version for a smaller footprint)
FROM node:16-alpine

# Set the working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React application for production
RUN npm run build

# Install a lightweight server to serve static files
RUN npm install -g serve

# Expose port 3000 for the app
EXPOSE 3000

# Command to serve the build folder on port 3000
CMD ["serve", "-s", "build", "-l", "3000"]

