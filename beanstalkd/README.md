# beanstalkd            
[![](https://images.microbadger.com/badges/image/divergence082/beanstalkd.svg)](https://microbadger.com/images/divergence082/beanstalkd "Get your own image badge on microbadger.com")
```
docker build -t divergence082/beanstalkd:1.10 .  
```

```
docker push divergence082/beanstalkd:1.10                            
```
  
```  
docker run -d \
           -p 2004:11300 \
           --env=ENV_BEANSTALKD_JOB_SIZE-2097152 \
           --name=beanstalkd-1.10-0 \
           divergence082/beanstalkd:1.10    
```
