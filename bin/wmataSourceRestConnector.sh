# This requires you to have installed com.tm.kafka.connect.rest.RestSourceConnector into the connector load path

curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ \
 -d '{
       "name": "wmata",
       "config": {
         "key.converter": "org.apache.kafka.connect.storage.StringConverter",
         "value.converter": "org.apache.kafka.connect.storage.StringConverter",
         "connector.class": "com.tm.kafka.connect.rest.RestSourceConnector",
         "tasks.max": "1",
         "rest.source.poll.interval.ms": "10000",
         "rest.source.method": "GET",
         "rest.source.url": "http://api.wmata.com/Bus.svc/json/jBusPositions?api_key=939c01312c384533be90522cce82b05b&format=json",
         "rest.source.headers": "Content-Type:application/json,Accept:application/json",
         "rest.source.topic.selector": "com.tm.kafka.connect.rest.selector.SimpleTopicSelector",
         "rest.source.destination.topics": "wmata_rest"
       }
     }'