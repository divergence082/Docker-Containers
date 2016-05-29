# kafka            

```
docker build -t divergence082/zookeeper:3.4.8 .  
```

```
docker push divergence082/zookeeper:3.4.8                            
```
  
```  
docker run -d \
           -v /opt/zookeeper/3.4.8/log:/zookeeper/log \
           -v /opt/zookeeper/3.4.8/data:/zookeeper/data \
           -v /opt/zookeeper/3.4.8/config:/zookeeper/config \
           -p 2181:2181 \
           --name=zookeeper-3.4.8-0 \
           divergence082/zookeeper:3.4.8                                 
           
```