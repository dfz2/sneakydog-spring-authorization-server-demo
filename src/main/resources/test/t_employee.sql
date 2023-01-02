create table t_employee
(
    id            int auto_increment
        primary key,
    name          varchar(128) not null,
    job           varchar(128) not null,
    manager_id    int          null,
    hire_date     date         not null,
    salary        bigint       not null,
    department_id int          not null
);

