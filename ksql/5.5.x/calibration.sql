SET 'auto.offset.reset'='earliest';

CREATE STREAM GEO_HEAT_MAP_STREAM
      ( WS BIGINT,
        WE BIGINT,
        GEOHASH STRING,
        UNITY INTEGER,
        TOTAL BIGINT)
WITH (KAFKA_TOPIC='GEO_HEAT_MAP', VALUE_FORMAT='JSON');

CREATE TABLE MAX_BIN_COUNT as
    SELECT MAX(TOTAL), UNITY
    FROM GEO_HEAT_MAP_STREAM
    GROUP BY UNITY
    EMIT CHANGES;
