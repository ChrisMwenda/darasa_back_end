README
My car Library Api star2
Optional point_left
Instructions for set up

    Clone this repository. grin

To get set up, run: running_woman	runner

$ bundle install   
$ rails db:migrate db:seed
$ rails s

This will download all the dependencies for our app and set up the database. And additionally start the rails server in your console.
Model Relationships

    A User has many Reviews

    A Review belongs to a User

Deployment to Railway +1bullettrain_front

    Create the application: Develop the application using the appropriate programming language and frameworks.

    Set up the database: Set up the database that will be used to store the application's data.

    Configure the server: Configure the server that will host the application on Railway.

    Configure the environment: Configure the environment that will be used to run the application on Railway. This includes setting up the necessary libraries and packages.

    Deploy the application: Deploy the application to Railway using the appropriate methods. This could involve using a deployment tool such as Capistrano or a manual deployment process.

    Test the application: Test the application to make sure it is running as expected.

    Monitor the application: Monitor the application to make sure it is running smoothly. This includes keeping track of errors and performance.

Sign Up Feature +1 page_facing_up

After creating the models, the next step is building out a sign up feature.

Handle sign up by implementing a POST /signup route. It should:

    Be handled in the UsersController with a create action
    In the create action, if the user is valid:
        Save a new user to the database with their username, encrypted password, image URL, and bio
        Save the user's ID in the session hash
        Return a JSON response with the user's ID, username,password, an HTTP status code of 201 (Created)
    If the user is not valid: exclamation
        Return a JSON response with the error message, and an HTTP status code of 422 (Unprocessable Entity)

    Note: Recall that we need to format our error messages in a way that makes it easy to display the information in our frontend. For this lab, because we are setting up multiple validations on our User and Reviews models, our error responses need to be formatted in a way that accommodates multiple errors.

Auto-Login Feature +1

Users can log into our app! tada But we want them to stay logged in when they refresh the page, or navigate back to our site from somewhere else.

Handle auto-login by implementing a GET /me route. It should:

    Be handled in the UsersController with a show action
    In the show action, if the user is logged in (if their user_id is in the session hash):
        Return a JSON response with the user's ID, username, image URL, and bio; and an HTTP status code of 201 (Created)
    If the user is not logged in when they make the request: exclamation
        Return a JSON response with an error message, and a status of 401 (Unauthorized)

Make sure the signup and auto-login features work as intended before moving forward.

You should also be able to test this in the React application by signing up via the sign up form to check the POST /signup route; and refreshing the page after logging in, and seeing that you are still logged in to test the GET /me route.
Login Feature +1

Now that users can create accounts via the API, let's give them a way to log back into an existing account.

Handle login by implementing a POST /login route. It should:

    Be handled in the SessionsController with a create action
    In the create action, if the user's username and password are authenticated:
        Save the user's ID in the session hash
        Return a JSON response with the user's ID, username, image URL, and bio
    If the user's username and password are not authenticated: exclamation
        Return a JSON response with an error message, and a status of 401 (Unauthorized)

Logout Feature

Users can log into our app! tada Now, let's give them a way to log out.

Handle logout by implementing a DELETE /logout route. It should:

    Be handled in the SessionsController with a destroy action
    In the destroy action, if the user is logged in (if their user_id is in the session hash):
        Remove the user's ID from the session hash
        Return an empty response with an HTTP status code of 204 (No Content)
    If the user is not logged in when they make the request: exclamation
        Return a JSON response with an error message, and a status of 401 (Unauthorized)

You should also be able to test this in the React application by logging in to check the POST /login route; and logging out with the logout button to test the DELETE /logout route.
Reviews List Feature

Users should only be able to view reviews on our site after logging in.

Handle Reviews viewing by implementing a GET /reviews route. It should:

    Be handled in the reviewsController with a index action
    In the index action, if the user is logged in (if their user_id is in the session hash):
        Return a JSON response with an array of all reviews with their title, instructions, and minutes to complete data along with a nested user object; and an HTTP status code of 201 (Created)
    If the user is not logged in when they make the request: exclamation
        Return a JSON response with an error message, and a status of 401 (Unauthorized)

Reviews Creation Feature blush

Now that users can log in, let's allow them to create new reviews!

Handle Reviews creation by implementing a POST /reviews route. It should:

    Be handled in the reviewsController with a create action
    In the create action, if the user is logged in (if their user_id is in the session hash):
        Save a new Reviews to the database if it is valid. The Reviews should belong to the logged in user, and should have title, instructions, and minutes to complete data provided from the params hash
        Return a JSON response with the title, instructions, and minutes to complete data along with a nested user object; and an HTTP status code of 201 (Created)
    If the user is not logged in when they make the request:
        Return a JSON response with an error message, and a status of 401 (Unauthorized)
    If the Reviews is not valid:
        Return a JSON response with the error messages, and an HTTP status code of 422 (Unprocessable Entity)

After finishing the ReviewsController features, you're done! Make sure to check your work.

You should also be able to test this in the React application by creating a new Reviews with the Reviews form, and viewing a list of reviews.
Thats it. MycarLib API is done. green_heart innocent