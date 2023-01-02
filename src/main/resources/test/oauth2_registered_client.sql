create table oauth2_registered_client
(
    id                            varchar(100)                        not null
        primary key,
    client_id                     varchar(100)                        not null,
    client_id_issued_at           timestamp default CURRENT_TIMESTAMP not null,
    client_secret                 blob                                not null,
    client_secret_expires_at      timestamp                           null,
    client_name                   varchar(200)                        null,
    client_authentication_methods varchar(1000)                       not null,
    authorization_grant_types     varchar(1000)                       not null,
    redirect_uris                 varchar(1000)                       not null,
    scopes                        varchar(1000)                       not null,
    client_settings               varchar(1000)                       null,
    token_settings                varchar(1000)                       null
);

