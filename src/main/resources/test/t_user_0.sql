create table t_user_0
(
    userId   bigint      not null
        primary key,
    userName varchar(50) null,
    constraint User_0_userId_uindex
        unique (userId)
);

