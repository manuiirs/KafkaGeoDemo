kafka-topics --bootstrap-server localhost:9092 --create \
  --topic ctaPrepped  --config retention.ms=-1
kafka-topics --bootstrap-server localhost:9092 --create \
  --topic GEO_HEAT_MAP  --config retention.ms=-1
