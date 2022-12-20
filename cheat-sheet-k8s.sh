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

# ----

#inicia o minikube
minikube start 

#mostra nosso dashboard de kubernetes
minikube dashboard 

#nos informa nossos nós (menor unidade de hardware)
kubectl get nodes 
kubectl describe nodes 

#cria um compenente com base no nosso arquivo de configuração
kubectl create -f postgres-sts.json 

#traz nossos componentes de statefulset
kubectl get statefulset 
# descreve nosso componente especificado
kubectl describe sts postgres
kubectl get pod 
# descreve do pod de nosso componente
kubectl describe pod postgres-0
kubectl logs postgres-0

#cria um compenente com base no nosso arquivo de configuração
kubectl create -f postgres-svc.json
#traz nossos componentes de servico
kubectl get svc
kubectl describe service postgres-svc


#cria um compenente com base no nosso arquivo de configuração
kubectl create -f api-deployment.json
# descreve nosso componente de deploy desejado (api-heroes)
kubectl describe deploy api-heroes
#traz nossos componentes de deploy
kubectl get deploy
# retorna os  nossos pods
kubectl get pod 
# descreve o pod especifico
kubectl describe pod api-heroes-68889b8456-6kvjf
# mostra o log de nosso pod
kubectl logs api-heroes-68889b8456-6kvjf
# mostra o log de nosso pod (stdout)
kubectl logs -f api-heroes-68889b8456-6kvjf
# altera o nosso compoenente de deployment
kubectl apply -f api-deployment.json

#cria um compenente com base no nosso arquivo de configuração
kubectl create -f api-svc.json
# retorna a url de nosso componente
minikube service api-heroes-svc --url 

#Deleta todos os componentes de configuraçao da /kubeconfig
kubectl delete -f .
#Cria todos os componentes de configuração da /kubeconfig
kubectl create -f .

#Deleta a instancia de minikube que estava rodando
minikube delete