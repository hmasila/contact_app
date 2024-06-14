# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## System dependencies
* Ruby - 3.3.0
* Rails - 7.1.3
* PostgreSQL

## Setup

1. Clone the repository:
  
    ```bash
    git clone https://github.com/hmasila/contacts_app.git
    cd contacts_app
    ```
    
2. Install dependencies:
    ```bash
      bundle install
    ```

3. Setup the database:

    ```
    rails db:create
    rails db:migrate
    rails db:seed
    ```
  
4. Start the Rails server:

    ```
    rails server
    ```

## Tests
```
rspec
``` 

## Deployment

Depending on where you are deploying, you can use capistrano, github actions, ci/cd, manual deployment

## Architectural Decisions
- Used Rails scaffold to quickly generate CRUD functionalities.
- Added basic validations to ensure data integrity.
- Used Tailwind CSS for modern and responsive UI.
- Used TDD(Test Driven Development) for best practices and to ensure application reliability
- Used Postgres for scalability
- Implemented pagination for the list of contacts if the dataset grows.
- Utilized partials to maintain DRY (Don't Repeat Yourself) principles.
