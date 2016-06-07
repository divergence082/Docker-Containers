# hdfs            

```
docker build -t divergence082/hdfs-hdp:2.4.2.0 .  
```

```
docker push divergence082/hdfs-hdp:2.4.2.0                            
```
  
- namenode
```  
docker run -dt \
           -p 9000:9000 \
           -p 50090:50090 \
           -p 50470:50470 \
           -v /opt/hdfs/2.4.2.0/config/hosts:/etc/hosts \
           -v /opt/hdfs/2.4.2.0/config/hadoop:/etc/hadoop/conf \
           -v /opt/hdfs/2.4.2.0/log/hadoop:/var/log/hadoop/hdfs \
           --name=hdfs-namenode-hdp-2.4.2.0 \
           divergence082/hdfs-hdp:2.4.2.0 \
           /hdp/scripts/namenode-start.sh
```

- secondary namenode
```  
docker run -dt \
           -v /opt/hdfs/2.4.2.0/config/hosts:/etc/hosts \
           -v /opt/hdfs/2.4.2.0/config/hadoop:/etc/hadoop/conf \
           -v /opt/hdfs/2.4.2.0/log/hadoop:/var/log/hadoop/hdfs \
           --name=hdfs-secondary-namenode-hdp-2.4.2.0 \
           divergence082/hdfs-hdp:2.4.2.0 \
           /hdp/scripts/secondary-namenode-start.sh
```

- datanode
```  
docker run -dt \
           -p 8010:8010 \
           -p 50010:50010 \
           -p 50075:50075 \
           -v /opt/hdfs/2.4.2.0/config/hosts:/etc/hosts \
           -v /opt/hdfs/2.4.2.0/config/hadoop:/etc/hadoop/conf \
           -v /opt/hdfs/2.4.2.0/log/hadoop:/var/log/hadoop/hdfs \
           --name=hdfs-datanode-hdp-2.4.2.0-0 \
           divergence082/hdfs-hdp:2.4.2.0 \
           /hdp/scripts/datanode-start.sh
```

journalnode
8480
