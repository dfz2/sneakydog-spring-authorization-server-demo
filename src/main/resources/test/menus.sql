create table menus
(
    id       bigint auto_increment
        primary key,
    parentId bigint       null,
    menuName varchar(100) null,
    perms    varchar(300) null,
    url      varchar(100) null,
    menuType varchar(50)  null
);

