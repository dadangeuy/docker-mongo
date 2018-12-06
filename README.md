# Docker Mongo
## How To Run
- Setup Docker Mongo: `docker-compose up`
- Setup Sharding: `./mongo-setup.sh`
## How To Shard DB
- Enable Shard Feature: `sh.enableSharding(<database>)`
- (Optional) Create Index for Sharded Key: `db.collection.createIndex(<keys>, <options>)`
- Shard Collection `sh.shardCollection(<collection>, <key>, <isUnique>, <options>)`
## Reference
- https://dzone.com/articles/composing-a-sharded-mongodb-on-docker
- https://docs.mongodb.com/manual/reference/method/sh.enableSharding/
- https://docs.mongodb.com/manual/reference/method/db.collection.createIndex/
- https://docs.mongodb.com/manual/reference/method/sh.shardCollection/
