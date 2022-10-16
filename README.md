# Echo <img src="https://cdn3.emoji.gg/emojis/3776-old-computer.png" width="32px" height="32px">
Echo is a server-like application that enables users to easily create and manage custom endpoints using a predefined 'Endpoints API'.

## Tech stack <img src="https://cdn3.emoji.gg/emojis/9833-stackoftreats.png" width="32px" height="32px">
* Programming language: **Ruby (2.7.1)**
* Framework: **Ruby on Rails (7.0.4)**
* Database to store mock endpoint details: **PostgreSQL**
* Testing framework: **RSpec**

## Installation and Usage <img src="https://cdn3.emoji.gg/emojis/2704-756.png" width="40px" height="40px">
* Ensure that appropriate versions of **Ruby** and **Ruby on Rails** are installed on the system.
* Install and set up **PostgreSQL**.
* To create the database tables execute the following in the root directory of the project:
```
rails db:create db:migrate
```
* Install all dependencies with:
```
bundle install
```
* Once set up, start the server using:
```
rails s
```

Once the server is up and running, requests can be made to the predefined Endpoints API which is documented in the 'Endpoints' section of this README.

* To view a documented representation of all the endpoints available to Echo including mock endpoints created by the user, please visit 'http://localhost:3000/swagger' in the browser.

* Tests for the server's endpoints have been written using RSpec. Command to run all tests:
```
bundle exec rspec
```

## Endpoints <img src="https://cdn3.emoji.gg/emojis/6757_Pixel_Book.gif" width="32px" height="32px">
**Note**: All APIs in this release of the application are versioned with the version 'v1'. Therefore, please be sure to include it in the URL of any endpoint before calling it, as such:
```
http://example.com/v1/path_name
```

**Following is the list of all endpoints available via the Endpoints API:**  

- GET http://localhost:3000/v1/endpoints
- POST http://localhost:3000/v1/endpoints
- PATCH http://localhost:3000/v1/endpoints{/:id}
- DELETE http://localhost:3000/v1/endpoints{/:id}

These endpoints are designated to manage mock endpoints served by Echo. Once created, these mock endpoints will be available over HTTP through their corresponding HTTP verb.

**Example**:

If you define the path of a mock endpoint as '/foo/bar/baz' and its verb as 'POST', the endpoint will be available over HTTP through: 
```
POST http://localhost:3000/v1/foo/bar/baz
```

## Feedback <img src="https://cdn3.emoji.gg/emojis/3757-catpumpkinpeek.gif" width="45px" height="45px">
Please feel free to create an 'Issue' or a 'Pull Request' if you feel that any part of the codebase can be improved in terms of readability, functionality, efficiency or performance. Feature ideas are welcome as well!

You can reach out to me at pratikdharamdasani29@gmail.com.