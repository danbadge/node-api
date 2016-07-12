docker build -t cheeky-api-image .

docker run -d -p 3000:80 --name cheeky-api-app cheeky-api-image