# hdfs            

```
docker build -t divergence082/hdfs:cdh-5.11 .  
```

```
docker push divergence082/hdfs:cdh-5.11                            
```

- namenode
```
docker run -dt \
          -v /opt/hdfs/cdh-5.11/config:/etc/hadoop/conf.my_cluster \
          -p 9000:9000 \
          -p 50070:50070 \
          -p 50470:50470 \
          --env-file=hdfs.env \
          --net=hdfs_hdfs_net \
          --ip=172.16.238.10 \
          --hostname=namenode.host \
          --add-host=snamenode.host:172.16.238.11 \
          --add-host=datanode.host:172.16.238.20 \
          --name=hdfs-namenode-cdh-5.11 \
          divergence082/hdfs:cdh-5.11 \
          /scripts/namenode-start.sh
```

- secondary-namenode
```
docker run -dt \
          -v /opt/hdfs/cdh-5.11/config:/etc/hadoop/conf.my_cluster \
          -p 50090:50090 \
          --env-file=hdfs.env \
          --net=hdfs_hdfs_net \
          --ip=172.16.238.11 \
          --hostname=snamenode.host \
          --add-host=namenode.host:172.16.238.10 \
          --add-host=datanode.host:172.16.238.20 \
          --name=hdfs-secondary-namenode-cdh-5.11 \
          divergence082/hdfs:cdh-5.11 \
          /scripts/secondary-namenode-start.sh
```

- datanode
```
docker run -dt \
          -v /opt/hdfs/cdh-5.11/config:/etc/hadoop/conf.my_cluster \
          -p 8010:8010 \
          -p 50010:50010 \
          -p 50020:50020 \
          -p 50475:50475 \
          --env-file=hdfs.env \
          --net=hdfs_hdfs_net \
          --ip=172.16.238.20 \
          --hostname=datanode.host \
          --add-host=namenode.host:172.16.238.10 \
          --add-host=snamenode.host:172.16.238.11 \
          --name=hdfs-datanode-cdh-5.11-0 \
          divergence082/hdfs:cdh-5.11 \
          /scripts/datanode-start.sh
```
