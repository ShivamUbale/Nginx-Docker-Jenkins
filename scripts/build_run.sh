IMAGE_NAME="nginx-devops"
CONTAINER_NAME="nginx-container"

echo "🔹 Starting deployment..."

echo "🔹 Stopping old container (if exists)..."
docker stop "$CONTAINER_NAME" 2>/dev/null || true
docker rm "$CONTAINER_NAME" 2>/dev/null || true

echo "Building Docker image..."
docker build -t $IMAGE_NAME:1.0 ./nginx

echo "Running Docker container..."
docker run -d \
  --restart always \
  -p 8080:80 \
  --name $CONTAINER_NAME \
  $IMAGE_NAME:1.0

echo "Deployment completed!"
