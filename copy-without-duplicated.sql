CREATE TEMP TABLE tmp_table
AS
SELECT * 
FROM main_table
WITH NO DATA;

COPY tmp_table FROM 'full/file/name/here';

INSERT INTO main_table
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING

DROP TABLE tmp_table;