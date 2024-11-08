#!/bin/bash

# Step 1: Build Docker images for frontend and backend
echo "Building frontend image..."
docker build -t techysurinder/frontend:latest ./frontend

echo "Building backend image..."
docker build -t techysurinder/backend:latest ./backend

# Step 2: Tag the images with appropriate versions (e.g., v1.0.0)
VERSION="v1.0.0"
echo "Tagging images with version $VERSION..."
docker tag techysurinder/frontend:latest techysurinder/frontend:$VERSION
docker tag techysurinder/backend:latest techysurinder/backend:$VERSION

# Step 3: Push images to Docker Hub
echo "Pushing frontend image to Docker Hub..."
docker push techysurinder/frontend:$VERSION

echo "Pushing backend image to Docker Hub..."
docker push techysurinder/backend:$VERSION

# Step 4: Update the Docker Compose file with new image versions
echo "Updating docker-compose.yml with new image versions..."

# Replace the image versions in docker-compose.yml
sed -i '' "s/myusername\/frontend:latest/techysurinder\/frontend:$VERSION/" docker-compose.yml
sed -i '' "s/myusername\/backend:latest/techysurinder\/backend:$VERSION/" docker-compose.yml

# Step 5: Run Docker Compose to start the application
echo "Starting application with Docker Compose..."
docker-compose up -d

# Done
echo "Deployment complete!"

