# README


This is as basic Paypal Checkout Button sample code

Install the Rails Application

1 visit : localhost:3000

2. Create Rider

```
POST https://localhost:3000/api/v1/riders

{
"name": "Jane Doe",
"email": "jane@hotmail.com",
"contact_number": "888877665"
}
```

# NOTE
On Success it will popup with paymentID

On Failure it will popup error message
