create table query (
    id integer primary key,
    timestamp timestamp,
    proto text,
    src_ip text,
    src_port integer,
    query text
);
