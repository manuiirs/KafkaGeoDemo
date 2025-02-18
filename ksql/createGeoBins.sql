SET 'auto.offset.reset'='earliest';

CREATE TABLE GEO_HEAT_MAP WITH (KAFKA_TOPIC='GEO_HEAT_MAP', PARTITIONS=1, REPLICAS=1)
  AS SELECT
    WINDOWSTART WS,
    WINDOWEND WE,
    BUS.GEOHASH GEOHASH,
    AS_VALUE(BUS.GEOHASH) GH,
    COUNT(*) TOTAL
  FROM BUS BUS
  WINDOW HOPPING ( SIZE 30 SECONDS , ADVANCE BY 10 SECONDS )
  GROUP BY BUS.GEOHASH
  EMIT CHANGES;

