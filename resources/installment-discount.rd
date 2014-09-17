Installment Discounts
=====================

The Installment Discount is the specific rate used for a given installment count in a credit card operation.

Endpoints
---------

### GET /installments/table

Receive the installment discount table for a given card type.

| Parameter      | Description                                                                                      |
| -------------- | ------------------------------------------------------------------------------------------------ |
| card_type      | The operation's card type (e.g. AMEX, VISA, etc)                                                 |

Correct Usage:

#### GET /installments/table?card_type=AMEX

`HTTP/1.1 200 OK`

```json
{
    "coefficient_2": "1.01",
    "coefficient_3": "1.01",
    "coefficient_4": "1.01",
    "coefficient_5": "1.01",
    "coefficient_6": "1.01",
    "coefficient_7": "1.01",
    "coefficient_8": "1.01",
    "coefficient_9": "1.01",
    "coefficient_10": "1.01",
    "coefficient_11": "1.01",
    "coefficient_12": "1.01",
    "coefficient_13": "1.01",
    "coefficient_14": "1.01",
    "coefficient_15": "1.01",
    "coefficient_16": "1.01",
    "coefficient_17": "1.01",
    "coefficient_18": "1.01",
    "coefficient_19": "1.01",
    "coefficient_20": "1.01",
    "coefficient_21": "1.01",
    "coefficient_22": "1.01",
    "coefficient_23": "1.01",
    "coefficient_24": "1.01"
}
```

If a card type either is not recognized or has no associated table, a 404 Not Found error is returned.

#### GET /installments/table?card_type=INEXISTENT

`HTTP/1.1 404 Not Found`

```json
{
    "error": "Table not found"
}
```

### GET /installments/discount

Receive a single particular discount rate for a given card type and installments count.

| Parameter      | Description                                                                                      |
| -------------- | ------------------------------------------------------------------------------------------------ |
| card_type      | The operation's card type (e.g. AMEX, VISA, etc)                                                 |
| installments   | The operation's amount of installments                                                           |

Correct Usage:

#### GET /installments/discount?card_type=AMEX&installments=2

`HTTP/1.1 200 OK`

```json
{
    "coefficient": "1.01",
}
```

If the card type is not recognized or has no associated table, a 404 Not Found error is returned.

#### GET /installments/table?card_type=INEXISTENT&installments=2

`HTTP/1.1 404 Not Found`

```json
{
    "error": "Discount not found"
}
```

If the installments count is an invalid number (higher than 24 or lower than 2), a 422 Unprocessable Entity is returned.

#### GET /installments/table?card_type=INEXISTENT&installments=25

`HTTP/1.1 422 Unprocessable Entity`

```json
{
    "error": "Invalid Discount Request"
}
```
