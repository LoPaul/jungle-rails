# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Fork & Clone
2. Run bundle to install dependencies
```sh
      bundle install
```
3. Create database.yml
```sh
      cp config/database.example.yml config/database.yml
```
4. Create secrets.yml
```sh
      cp config/secrets.example.yml config/secrets.yml
```
5. Run to create, load and seed db
```sh
      bin/rake db:reset
```
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server
```sh
      bin/rails s -b 0.0.0.0
```

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Final Product
![Main Screen](https://github.com/LoPaul/jungle-rails/blob/master/docs/jungle-app.gif)


## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
