cd /var/lib/jenkins/workspace
sudo docker build -t siriusgti/php-app:${BUILD_ID} .
sudo docker push siriusgti/php-app:${BUILD_ID}
sudo docker rmi siriusgti/php-app:${BUILD_ID}

ssh ubuntu@52.59.247.75 "docker pull siriusgti/php-app:${BUILD_ID}"
ssh ubuntu@52.59.247.75 "docker stop app-prod"
ssh ubuntu@52.59.247.75 "docker rm app-prod"
ssh ubuntu@52.59.247.75 "docker run --name app-prod -p 80:80 -d -t siriusgti/php-app:${BUILD_ID}"
