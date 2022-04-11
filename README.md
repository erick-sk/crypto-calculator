# Crypto Calculator

Application that calculates the annual projection of an investment in dollars on the acquisition of two cryptocurrencies Bitcoin and Ethereum. With a monthly intreres of 5% and 3% respectively for each type of cryptocurrency.

## Tech Stack

- Ruby 3.1.0
- Rails 7.0.2.3
- Sqlite3 1.4


Gems:

- tailwindcss-rails 2.0
- faraday 2.2
- csv 3.2

## Initialize Project

Clone project

```bash
  git clone git@github.com:erick-sk/crypto-calculator.git
```

Go to project directory

```bash
  cd crypto-calculator
```

Install dependencies

```bash
  bundle install
```

Preparing the database:

```bash
  rails db:create
  rails db:migrate
```

Start server

```bash
  rails server
```

Start tailwindcss:

```bash
  bin/dev
```