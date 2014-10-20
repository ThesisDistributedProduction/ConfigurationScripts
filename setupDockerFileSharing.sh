docker run -v /mnt/sda1/sharedData:/data --name sharedData busybox true
docker run --rm -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba sharedData