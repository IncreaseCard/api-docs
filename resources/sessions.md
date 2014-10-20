Sessions
========

A session must be started to have any kind of interaction with Increasecard's operation API.

Endpoints
---------

### POST /login

Attempt to create a session for a given user.

| Parameter      | Description                                                                                      |
| -------------- | ------------------------------------------------------------------------------------------------ |
| email          | The user's e-mail                                                                                |
| password       | The user's password                                                                              |

The auth_token returned is to be used in every request that involves sensitive client information.
It identifies the new session, which is valid for 24 hours.

Correct Usage:

#### POST /login

```json
{
    "email": "test@increasecard.com",
    "password": "password"
}
```

`HTTP/1.1 200 OK`

```json
{
    "client": {
      "auth_token": "2731c82cb6ac8ebe7ab4f1aec46436c19d589440",
      "email": "test@increasecard.com",
      "first_name": "Test",
      "last_name": "Increase"
    }
}
```

If the email-password combination is invalid, then a 401 Unauthorized error is returned.

#### POST /login

```json
{
    "email": "test@increasecard.com",
    "password": "notpassword"
}
```

`HTTP/1.1 401 Unauthorized`

```json
{
    "error": "Invalid email/password"
}
```

### DELETE /logout

Destroys the session associated with the given auth_token.

| Parameter      | Description                                                                                      |
| -------------- | ------------------------------------------------------------------------------------------------ |
| auth_token     | The session's associated authentication token                                                    |

Correct Usage:

#### DELETE /logout

```json
{
    "auth_token": "2731c82cb6ac8ebe7ab4f1aec46436c19d589440"
}
```
`HTTP/1.1 200 OK`

```json
{
    "message": "Successfully logged out"
}
```

If there is no session associated to the given auth_token, the same message will be given as a reply.