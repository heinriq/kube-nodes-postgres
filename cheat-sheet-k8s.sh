#verifica imagens 
docker ps

#deleta imagens docker
docker image rm $IMAGE

#loga no dockerhub
docker login 

#builda uma imagem docker com o dockerfile respectivo, a flag -t é quem nomeia a imagem
docker build -t app \
    nodejs-with-postgres-api-example

# lista as imagens docker
docker image ls

# cria um apelido para a imagem, com o usuario do dockerhub/repositorio
docker tag app heinriq/kube-node-postgres 
# sobe para o dockerhub
docker push heinriq/kube-node-postgres

