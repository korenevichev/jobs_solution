##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby 2.6.0
- Rails 6.0.3

##### 1. Check out the repository

```bash
git clone git@github.com:korenevichev/jobs_solution.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```
##### 3. Populate database with data

```ruby
bundle exec rake db:seed
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

##### 5. Run tests

You can run tests  using the command given below.

```ruby
rspec
```