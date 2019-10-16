# docker-ubuntu
### 使用方式
```
docker-compose build --build-arg DockerID=$(cat /etc/group|grep docker|cut -d':' -f3)
```
