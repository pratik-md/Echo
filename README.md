# Echo

## Overview
Echo is a server-like application that enables users to easily create and manage custom endpoints using a predefined 'Endpoints API'.

## Tech stack
* Programming language: Ruby (2.7.1)
* Framework: Ruby on Rails (7.0.4)
* Database: Postgresql
* Testing framework: RSpec

## Installation and Usage
* Ensure that Ruby is installed on the system
* Install Ruby on Rails and Postgresql
* To create and set up the database execute the following in the root directory of the project:

```
rails db:create db:migrate
```
* Once set up, start the server using:

```
rails s
```

Once the server is up and running, requests can be made to the pre-defined Endpoints API which is documented in the 'Endpoints' section of this README.

* To view a documented representation of all the endpoints available to Echo including mock endpoints created by the user, please visit 'http://localhost:3000/swagger' in the browser.

* Tests for the server's endpoints have been written using RSpec. Command to run all tests:
```
bundle exec rspec
```

## Endpoints
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