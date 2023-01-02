create table oauth2_authorization
(
    id                            varchar(100)  not null
        primary key,
    registered_client_id          varchar(100)  not null,
    principal_name                varchar(200)  not null,
    authorization_grant_type      varchar(100)  not null,
    attributes                    longtext      null,
    state                         varchar(500)  null,
    authorization_code_value      blob          null,
    authorization_code_issued_at  timestamp     null,
    authorization_code_expires_at timestamp     null,
    authorization_code_metadata   varchar(2000) null,
    access_token_value            blob          null,
    access_token_issued_at        timestamp     null,
    access_token_expires_at       timestamp     null,
    access_token_metadata         varchar(2000) null,
    access_token_type             varchar(100)  null,
    access_token_scopes           varchar(1000) null,
    oidc_id_token_value           blob          null,
    oidc_id_token_issued_at       timestamp     null,
    oidc_id_token_expires_at      timestamp     null,
    oidc_id_token_metadata        varchar(2000) null,
    refresh_token_value           blob          null,
    refresh_token_issued_at       timestamp     null,
    refresh_token_expires_at      timestamp     null,
    refresh_token_metadata        varchar(2000) null
);

