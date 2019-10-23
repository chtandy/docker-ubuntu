# docker-ubuntu
### 整入內容
- ansible
- docker
- kubectl client
- aws cli



### awsDockerfile
- ansible
- docker
- kubectl client
- aws cli
- eksctl
- aws-iam-authenticator


### 使用方式
- linux
```
docker-compose build --build-arg DockerID=$(cat /etc/group|grep docker|cut -d':' -f3)
```
- mac,因為沒有docker group
```
docker-compose build --build-arg DockerID=999
```
