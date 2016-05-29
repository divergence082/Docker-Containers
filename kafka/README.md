# kafka            

```
docker build -t divergence082/kafka:2.11-0.10.0.0 .  
```

```
docker push divergence082/kafka:2.11-0.10.0.0                            
```
  
```  
docker run -d \
           -v /opt/kafka/2.11-0.10.0.0/log:/kafka/log \
           -v /opt/kafka/2.11-0.10.0.0/data:/kafka/data \
           -v /opt/kafka/2.11-0.10.0.0/config:/kafka/config \
           -v /opt/kafka/2.11-0.10.0.0/zookeeper/data:/kafka/zookeeper/data \
           -p 9092:9092 \
           --name=kafka-2.11-0.10.0.0-0 \
           divergence082/kafka:2.11-0.10.0.0                                 
           
```