# consul            

```
docker build -t divergence082/consul:0.6.4 .  
```

```
docker push divergence082/consul:0.6.4                            
```
  
```  
docker run -d \
           -p 8600:8600 \
           -p 8500:8500 \
           -p 8400:8400 \
           -p 8300-8302:8300-8302 \
           -v /opt/consul/0.6.4/config:/consul/config \
           --name=consul-0.6.4-0 \
           divergence082/consul:0.6.4
```
