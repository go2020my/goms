## 部署服务

### 创建命名空间
```
kubectl create namespace ek8sv1
```
### 部署服务
```
./apply.sh
```
### 删除服务
```
./delete.sh
```
## 逐个部署
### mysql
```
kubectl apply -f mysql-deploy.yaml --record
kubectl get rs,pod,deploy,svc,ep -n ek8sv1

kubectl apply -f mysql-svc.yaml --record
kubectl get rs,pod,deploy,svc,ep -n ek8sv1

kubectl describe pod mysql-deploy -n ek8sv1
mysql -h 192.168.43.204 -P 31001 -u root -p
```
### redis  
```
kubectl apply -f redis-sts.yaml --record
kubectl get rs,pod,deploy,sts,svc,ep -n ek8sv1

kubectl apply -f redis-svc.yaml --record
kubectl get rs,pod,deploy,sts,svc,ep -n ek8sv1

kubectl describe pod redis-deploy -n ek8sv1
redis-cli -h 192.168.43.204 -p 31002
```
### user  
```
kubectl apply -f user-deploy.yaml --record
kubectl get rs,pod,deploy,svc,ep -n ek8sv1

kubectl apply -f user-svc.yaml --record
kubectl get rs,pod,deploy,svc,ep -n ek8sv1

kubectl describe pod user-deploy -n ek8sv1
curl 192.168.43.204:31003/ping
```
## 其他

### log
```
kubectl logs -n ek8sv1 service/redis-svc
```
### login
```
kubectl exec -it pod/user-deploy-7fc88fdcbf-gn7kl -n ek8sv1 -- /bin/sh
kubectl exec -it deployment.extensions/mysql-deploy -n ek8sv1 -- /bin/sh
kubectl exec -it service/user-svc -n ek8sv1 -- /bin/sh
```