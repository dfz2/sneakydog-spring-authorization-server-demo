create table REGISTERED_CLIENT
(
    ID            varchar(100)  not null
        primary key,
    CLIENT_ID     varchar(200)  null,
    CLIENT_SECRET varchar(400)  null,
    JSON_CONTENT  varchar(5000) null,
    constraint REGISTERED_CLIENT_CLIENT_ID_uindex
        unique (CLIENT_ID),
    constraint REGISTERED_CLIENT_ID_uindex
        unique (ID)
);

