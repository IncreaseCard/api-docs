Increasecard API
====================

This is a JSON API offered by Increasecard.

Making a request
----------------

The base URL for the API is `https://app.increasecard.com/api/v1/`.

Client-side Errors
------------------

API calls may have one of many of the following errors:

* Sending an invalid or incomplete JSON will yield a `400 Bad Request` response.

```
HTTP/1.1 400 Bad Request

{ "error": "Missing Parameters" }
```

* Asking for inexistent resources will yield a `404 Not Found` response.

```
HTTP/1.1 404 Not Found

{ "error": "Resource not found" }
```

Server-side Errors
------------------

Any error with a 5XX error is a server-side error. These mean that either the app is not available, under maintenance or a connection error. In any case, try again later.


API Resources
-----------------

* [Sessions](https://github.com/IncreaseCard/api-docs/blob/master/resources/sessions.md)
* [Operations](https://github.com/IncreaseCard/api-docs/blob/master/resources/operations.md)
* [Installment Discounts](https://github.com/IncreaseCard/api-docs/blob/master/resources/installment-discount.md)

Contact us
----------

If you have any ideas or suggestions to help make the Increasecard API better, please do not hesitate to either contact us at <mailto:api@increasecard.com> or leave us an issue on GitHub.
