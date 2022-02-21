-- 1)
-- with a AS 	(
-- 	select word, string_agg(replace(word,' ',''), '|') as tok from word group by word
-- )
-- select a.word from a where to_tsvector('testzhcfg','三胖是厉害的') @@ to_tsquery('testzhcfg', a.tok)

-- 2)
-- CREATE OR REPLACE FUNCTION get_token(INOUT a text)
-- AS $$
-- BEGIN
-- EXECUTE 'select string_agg(replace('''|| a ||''','' '',''''), ''|'')' INTO a;
-- END;
-- $$
-- LANGUAGE plpgsql

-- SELECT * from word where to_tsvector('testzhcfg','三胖是厉害的') @@ to_tsquery('testzhcfg', get_token(word))