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

## If you get SSL errors use following link: https://gist.github.com/fnichol/867550

## Database Configuration
In database.yml
- To use sqlite3, make sure lines 1-21 are uncommented and 23-34 are
- To use postgres/pgadmin, make sure lines 1-21 are commented out and 23-34 are not
- You may need to set up an a root username in pgadmin after you create the DB

## Database Seeding
- Ensure your rails server is shutdown and you disconnect from the server in PG Admin
- From your console run: ```bundle exec rake db:migrate:reset RAILS_ENV=development```
- Followed by: ```bundle exec rake db:seed```
- Database should now have 99 records, and 40 of them are guides
- Note that seeds are cumulative; running ```rake db:seed``` three times will grant 297 records
- To clear DB, simply run ```rake db:migrate:reset``` again


## Database Seeding on Heroku
- Run: ```heroku run rake db:seed```
- Followed by: ```heroku run rake db:migrate```
- To clear the DB, run: ```heroku pg:reset DATABASE```

## Configurations
Since we are running this app locally and our repository is public we should
make the following configuration, and make sure to not commit these changes or
we may need to use ```dotenv``` to simplify these process.

- Add database password to config/database.yml under **production** database
- To run the app in **production** environment set the secret key in
config/secrets.yml


## Useful commands
```shell
# Generate scaffold
rails generate scaffold the-name

# Migrate database changes, which will update the development.sqlite3
database in db folder
rake db:migrate RAILS_ENV=development

# Start database command line interface
rails dbconsole [test|development|production]

# Rails console that will rollback after you exit the console
rails console --sandbox
# Console
heroku run rails c --sandbox

# Run tests
rake test
rake test TEST=/the/test/path # Runs only one test
```

## "A server is already running" error
If you forget to shutdown your server after a coding session and get this error,
simply go to temp/pids/server.pid and delete this file. Then run ```rails server```
again.

## Deployments
- https://devcenter.heroku.com/articles/getting-started-with-ruby#introduction
- Any commands that may happen on heroku must use the heroku keyword
- - heroku rake db:seed
- - heroku rake db:migrate
- etc...

## Credits
Some code in this project is from
- [railstutorial.org](https://www.railstutorial.org/book) book by Michael Hartl
- [Bootstrap Template](https://github.com/IronSummit/Media/startbootstrap-modern-business) used was created by David Miller
- [Calendar](https://github.com/dangrossman/bootstrap-daterangepicker) for reservations was written by Dan Grossman
