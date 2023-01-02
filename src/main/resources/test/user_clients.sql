create table user_clients
(
    id       bigint auto_increment
        primary key,
    username varchar(100) null,
    clientId varchar(100) null
);

