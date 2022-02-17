Postgres-searching
=====

### How to use

    1. docker build -t zcfrank1st/postgres-with-zhparser:1.0 .
    2. docker run --name pg-zhparser -e POSTGRES_PASSWORD=xxxx -p xxxx:5432 -d zcfrank1st/postgres-with-zhparser:1.0
    3. 
    SELECT * FROM ts_parse('zhparser', '保障房资金压力');
    INSERT INTO zhparser.zhprs_custom_word VALUES('资金压力');
    SELECT sync_zhprs_custom_word();
    4.
    SELECT xx FROM ts_parse('zhparser', '保障房资金压力')
    INTERSECT
    SELECT word FROM zhparser.zhprs_custom_word;