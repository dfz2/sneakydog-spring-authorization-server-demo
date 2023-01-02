create table myorder
(
    order_id     bigint auto_increment
        primary key,
    customer_id  bigint         null,
    pay_amount   decimal(19, 2) null,
    total_amount decimal(19, 2) null,
    constraint myorder_order_id_uindex
        unique (order_id)
);

