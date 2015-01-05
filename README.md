# Capn-Crunch

## Setup
- git clone https://github.com/RadVenturepdx/Capn-Crunch.git
- Add database password to config/database.yml
- Install required gems: ```bundle install ```
- Run rails server in development environment: ```rails server --environmnet development ```. This will create development.sqlite3 om db folder

## Useful commands
```shell
# Generate scaffold
rails generate scaffold the-name

# Migrate database changes, which will update the development.sqlite3 database in db folder
bundle exe rake db:migrate RAILS_ENV=development
```
