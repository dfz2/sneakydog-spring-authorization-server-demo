create table t_user_1
(
    userId   bigint      not null
        primary key,
    userName varchar(50) null,
    constraint User_1_userId_uindex
        unique (userId)
);

