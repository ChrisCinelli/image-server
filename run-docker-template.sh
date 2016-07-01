docker build -t image-server .
docker run -p 8081:3000 -e DEBUG='*' -e S3_REGION='us-west-2' -e AWS_KEY='AKIAYOUR-KEY-GOES-HERE' -e AWS_SECRET='YourSecretgoesHere' -e S3_BUCKET='your-bucket-name-for-cached-images' image-server
