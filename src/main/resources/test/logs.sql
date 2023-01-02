create table logs
(
    username    varchar(500) null,
    ipAddress   varchar(300) null,
    region      varchar(20)  null,
    userAgent   varchar(500) null,
    createdAt   datetime     null,
    loginStatus varchar(100) null,
    id          bigint       not null
        primary key
);

