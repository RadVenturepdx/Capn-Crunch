# Capn-Crunch

## Setup
The very first few steps to run the app locally
- git clone https://github.com/RadVenturepdx/Capn-Crunch.git
- Install required gems: ```bundle install ```
- Run rails server in different environment:
```shell
rails server --environment [test|development|production]
# test & development creates test|development.sqlite3 in db folder
# production connect to aws database, yes this is **production**,
# so mess around in development in sqlite database :-D
```


## Configurations
Since we are running this app locally and our repository is public we should make the following configuration, and make sure to not commit these changes or we may need to use ```dotenv``` to simplify these process.


- Add database password to config/database.yml under **production** database
- To run the app in **production** environment set the secret key in config/secrets.yml


## Useful commands
```shell
# Generate scaffold
rails generate scaffold the-name

# Migrate database changes, which will update the development.sqlite3 database in db folder
rake db:migrate RAILS_ENV=development

# Start database command line interface
rails dbconsole [test|development|production]

# Run tests
rake test
```

## Credits
Some codes in this project is used from [railstutorial.org](https://www.railstutorial.org/book) book by Michael Hartl
## Test comment
