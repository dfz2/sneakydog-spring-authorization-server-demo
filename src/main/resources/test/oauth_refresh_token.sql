create table oauth_refresh_token
(
    token_id       varchar(255) null,
    token          blob         null,
    authentication blob         null
);

