#Build the Image
docker build --tag <DOCKER_ID>/azurefunctionsimage:v1.0.0 .

#Run the Image
docker run -p 8080:80 -it <DOCKER_ID>/azurefunctionsimage:v1.0.0

#Push to dockerhub
docker push weinnovatedesign/myfunctionapp:latest

docker build -t weinnovatedesign/myfuntionapp:latest .
