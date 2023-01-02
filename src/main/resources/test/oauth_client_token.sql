create table oauth_client_token
(
    token_id          varchar(255) null,
    token             blob         null,
    authentication_id varchar(255) null,
    user_name         varchar(255) null,
    client_id         varchar(255) null
);

