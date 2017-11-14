# README

Given that the data is in the JSON files provided, this is a simple implementation of querying and joining data across different entities. The provided json files are in the public folder. This is a rails console application. The logic to search is in the controller. 

Before you start, please run `bundle install` to install the missing gems (This application uses `awesome-print` to make the output better readable).

## Database creation
run `rake db:migrate` This will migrate the schema to SQLite

## Database initialization
run `rake db:seed`  This will initialize the database with see data. The seed file reads the data from the json files and populates the database.

## How to use 
- Go to rails console (Type `rails c` on the terminal).
- Type `SearchController.SearchMe(object, field, value)` where object is one of the [User, ticket, organization]. field is the column name which is the search criteria and value determines the exact record to look for. 
Example : `SearchController.SearchMe("User", "name", "Francisca Rasmussen")` will return the details of all the users whose name is "Francisca Rasmussen", the information of the organization that the user belongs to and all the tickets that are either assigned to or submitted by this user. 
Similarly, `SearchController.SearchMe("Ticket", "subject", "abc")` will return the ticket information, the user information for the asignee and the submitter and the organization information for the ticket.
The same goes with `SearchController.SearchMe("Organization", "_id", "101")` will return the organization information, the information of all the users who belong to this organization and all the tickets that belong to this organization.

## How to run the test suite
- Migrate the seed data to the test database by running `rake RAILS_ENV=test db:seed`.
- Run `rspec` to run all of the tests written for the controller and the model classes. 
- Run individual specs with any of the following commands
    1. `rspec spec/models/user_spec.rb`
    2. `rspec spec/models/ticket_spec.rb`
    3. `rspec spec/models/organization_spec.rb`
    4. `rspec spec/controllers/search_controller_spec.rb`

