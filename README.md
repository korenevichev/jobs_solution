##### Prerequisites

The setups steps expect following tools installed on the system.

- Yarn
- Ruby 2.6.0
- Rails 6.0.3

##### 1. Check out the repository

```bash
git clone git@github.com:korenevichev/jobs_solution.git
```

##### 2. Bundle install

Run the following command to install gems.

```ruby
bundle install
```


##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```
##### 4. Populate database with data

```ruby
bundle exec rake db:seed
```

##### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

##### 6. Run tests

You can run tests  using the command given below.

```ruby
rspec
```