# Capn-Crunch

## Setup
The very first few steps to run the app locally
- git clone https://github.com/RadVenturepdx/Capn-Crunch.git
- Install required gems: ```bundle install ```
- Run rails server in different environment:
```shell
rails server --environmnet [test|development|production]
# test & development creates test|development.sqlite3 in db folder
# production connect to aws database, yes this is **production**, so mess around in development in sqlite database :-D
```


## Configurations
Since we are running this app locally and our repository is public we should make the following configuration, but we may need to use ```dotenv``` to simplify these process for us.


- Add database password to config/database.yml under **production** database
- To run the app in **production** environment we need to set a secret key, so we need to generate our own since we are all running the app locally:
```
rake secret
# This gives you a really long string, which you then copy it to secret_base in config/secrets.yml
```


## Useful commands
```shell
# Generate scaffold
rails generate scaffold the-name

# Migrate database changes, which will update the development.sqlite3 database in db folder
bundle exe rake db:migrate RAILS_ENV=development

# Run tests
bundle exe rake test
```

## Creadits
Some codes in this project is used from [railstutorial.org](https://www.railstutorial.org/book) book by Michael Hartl
