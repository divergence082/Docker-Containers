# beanstalkd            

```
docker build -t divergence082/beanstalkd:1.10 .  
```

```
docker push divergence082/beanstalkd:1.10                            
```
  
```  
docker run -d \
           -v /opt/beanstalkd/1.10/data:/beanstalkd/data \
           -p 2004:11300 \
           --name=beanstalkd-1.10-0 \
           divergence082/beanstalkd:1.10                                     
```