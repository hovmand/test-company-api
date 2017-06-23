# Test Company API
An API that handles companies.

## Development
Creating the database
```
$ rake db:create:all
$ rake db:migrate
```

Dropping the database
```
$ rake db:drop
```

Running the application
```
$ ruby app.rb
```

## API
The API has two endpoints. The following list shows the endpoints and their
available HTTP methods.

- `/company` POST + GET
- `/company/:id` GET

### List of Companies
The list of companies is fetched as follows:
```
GET /company HTTP/1.1
Host: localhost:4567
```

### Creating a company
A company is created with a POST request to the company endpoint.

Example using cURL:
```
$ curl -i http://localhost:4567/company -X POST -d '{"cvr":"123","name":"von And","address":"Bilbremsebakken 1","city":"Andeby","country":"Skotland","phone_number":"12345678"}' -H "Content-Type: application/json"
```

### Single company details
To fetch information about a single company the if of the company is appended
to the company endpoint.

Fetching the company with id = 5 is done as follows:
```
GET /company/5 HTTP/1.1
Host: localhost:4567
```
