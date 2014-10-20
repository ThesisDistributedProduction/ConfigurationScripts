



sudo docker run --name mongo-pri   -d -p 27017:27017 mongo:latest
sudo docker run --name mongo-sec_a -d -p 27018:27017 mongo:latest
sudo docker run --name mongo-sec_b -d -p 27019:27017 mongo:latest
