docker info                 
docker build --no-cache  -t $image_name .  # Build docker image frm dockerfile
docker run -itd -p 8080:8080  --name $cont_name $image_name   #create container using docker image 
docker ps 
docker inspect $cont_name  # getting info about container     
