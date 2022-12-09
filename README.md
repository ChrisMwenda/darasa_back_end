Darasa Web App

This is a monolith app, intended to be a simple example of a CRUD app built with Ruby on Rails and React.js. It's an SQLITE3 database and a simple react frontend that can be used to interact with the database.
This API uses:

Ruby version 2.7.4 Rails version 7.0.4 Running it on local environment

run bundle install to install all dependencies then run bundle exec rails s to open the server and be able to request data from the database 
Post man can be used to fetch data from the database or interact with the database from the frontend. 

To install dependencies for the frontend, run npm install --prefix client from the project root and run npm start --prefix client on another terminal to open it on the browser.

Tables in the database

users - different users registered and persisted in the database 
reviews - collection of reviews that have been created for specific user
seeding the database

there is a seeds.rb file in the db directory. It contains sample data for testing purposes run rails db:seed to seed the database
Serialization

For this app, active_model_serializers gem was used. gem "active_model_serializers" is inserted into the gemfile and run bundle install to install. Now we can use a generator to create a new serializer Serializers gives ability to create the exact structure for the data to expose as JSON from the api
Endpoints

GET /airlines - returns a list of all available airlines in the database GET /airlines/:id - return a airline matching the specified id GET /reviews - returns a list of all available reviews including user and airline in the database POST /reviews - creates a review and associtates with the specified user and airline in the database