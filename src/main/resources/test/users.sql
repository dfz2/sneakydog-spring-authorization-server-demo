create table users
(
    id       bigint            not null
        primary key,
    username varchar(50)       not null,
    password varchar(100)      not null,
    enabled  tinyint default 1 not null,
    email    varchar(100)      null,
    age      int               null,
    constraint users_username_uindex
        unique (username)
);

