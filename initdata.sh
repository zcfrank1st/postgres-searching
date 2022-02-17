#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE searching;
    \c searching;
    CREATE EXTENSION zhparser;
    CREATE TEXT SEARCH CONFIGURATION testzhcfg (PARSER = zhparser);
    ALTER TEXT SEARCH CONFIGURATION testzhcfg ADD MAPPING FOR n,v,a,i,e,l WITH simple;
EOSQL