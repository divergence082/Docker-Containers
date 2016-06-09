# kafka            

- build
```
docker build -t divergence082/zookeeper:3.4.8 .  
```

- push
```
docker push divergence082/zookeeper:3.4.8                            
```
  
- run
```  
docker run -d \
           -v /opt/zookeeper/3.4.8/config:/zookeeper/config \
           -p 2181:2181 \
           --name=zookeeper-3.4.8-0 \
           divergence082/zookeeper:3.4.8 \
           /zookeeper/scripts/zookeeper-start.sh
```
