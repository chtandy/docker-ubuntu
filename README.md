# docker-ubuntu
### 整入內容
- ansible
- docker
- kubectl client
- aws cli
### 使用方式
```
docker-compose build --build-arg DockerID=$(cat /etc/group|grep docker|cut -d':' -f3)
```
