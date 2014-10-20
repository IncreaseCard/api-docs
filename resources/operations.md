Operations
==========

The Operations are the representation of any credit/debit card operation that took place in a client's shops.

Endpoints
---------

### GET /operations

Receive the operations for a given daterange, card type, and price range.
This endpoint requires an open session, hence the need for an auth_token in the request.
Also, the operations are paged, so the required page must be specified.
Note that if any parameter is missing (except for the auth_token), the server will simply not filter by that parameter.

| Parameter      | Description                                                                                      |
| -------------- | ------------------------------------------------------------------------------------------------ |
| auth_token     | The open session's associated authentication token                                               |
| card_type      | The operation's card type (e.g. AMEX, VISA, etc)                                                 |
| higher         | The operations will have a higher value than the number given here                               |
| lower          | The operations will have a lower value than the number given here                                |
| daterange      | The daterange in which the operations or their pay dates must have taken place                   |
| by_pay_date    | Decides whether the daterange filters by operation day or pay date (0 or 1 respectively)         |
| page           | The operation list page desired                                                                  |

Correct Usage:

#### GET /operations

```json
{
    "auth_token": "2731c82cb6ac8ebe7ab4f1aec46436c19d589440",
    "card_type": "AMEX",
    "daterange": "01/09/2014 - 17/09/2014",
    "by_pay_date": "0",
    "higher": "100",
    "lower": "200",
    "page": "1"
}
```

`HTTP/1.1 200 OK`

```json
{
    "operations": [
      {
        "auth_code": "450",
        "card_type": "AMEX",
        "card_kind": "CRED",
        "card_number": "XXXXXXXXXX561234"
        "installment": "3",
        "value": {
          "currency": {
            "iso_code": "ARS",
            "symbol": "$"
          },
          "fractional": "15000"
        },
        "date": "2014-09-01T08:43:21-03:00",
        "pay_value": {
          "currency": {
            "iso_code": "ARS",
            "symbol": "$"
          },
          "fractional": "14460"
        },
        "pay_date": "2014-09-25T08:43:21-03:00",
        "shop_id": "54071b7eabe1cf60bb000005",
        "shop_name": "Test Shop",
        "posterminal_id": "54071b7eabe1cf60bb000004"
      }
    ],
    "pages": "1"
}
```