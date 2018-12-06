// mongo-config
echo "[setup mongo-config]" &&
docker exec -it mongo-config bash -c "echo 'rs.initiate({_id:\"config\",configsvr:true,members:[{_id:0,host:\"mongo-config:27017\"}]})' | mongo" &&

// mongo-shard-1
echo "[setup mongo-shard-1]" &&
docker exec -it mongo-shard-1 bash -c "echo 'rs.initiate({_id:\"shard-1\",members:[{_id:0,host:\"mongo-shard-1:27017\"}]})' | mongo" &&

// mongo-shard-2
echo "[setup mongo-shard-2]" &&
docker exec -it mongo-shard-2 bash -c "echo 'rs.initiate({_id:\"shard-2\",members:[{_id:0,host:\"mongo-shard-2:27017\"}]})' | mongo" &&

// mongo-shard-3
echo "[setup mongo-shard-3]" &&
docker exec -it mongo-shard-3 bash -c "echo 'rs.initiate({_id:\"shard-3\",members:[{_id:0,host:\"mongo-shard-3:27017\"}]})' | mongo" &&

echo "[setup mongos]" &&
sleep 10s &&
docker exec -it mongos bash -c "echo 'sh.addShard(\"shard-1/mongo-shard-1:27017\")' | mongo" &&
docker exec -it mongos bash -c "echo 'sh.addShard(\"shard-2/mongo-shard-2:27017\")' | mongo" &&
docker exec -it mongos bash -c "echo 'sh.addShard(\"shard-3/mongo-shard-3:27017\")' | mongo"
