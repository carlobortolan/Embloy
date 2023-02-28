<h1>EMBLOY</h1>

## License

### Licensed under either of

> Apache License, Version 2.0, ([LICENSE-APACHE](http://www.apache.org/licenses/LICENSE-2.0))

> MIT license ([LICENSE-MIT](http://opensource.org/licenses/MIT))

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by anyone, as
defined in the Apache-2.0 license, shall be dual licensed as above, without any additional terms or conditions.

## Functionality

> __NOTE__: _This file covers the web-application. If you are looking for the API documentation instead, go to_
___[api.md](app/controllers/api/v0/api.md)___

### Managing of applications for available jobs

The system is able to manage jobs and application (supporting
basic [CRUD-Operations](https://www.javatpoint.com/crud-operations-in-sql)) and notifies the employer when a new
application is submitted as well as the applicant when his application is accepted.

All notifications are sent using [SMTP](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol).

### Filtering of available jobs

The system receives a set of available jobs and filters them returning a sorted feed according to the user's parameters.
_Default values for search_:

- coordinates *<user's longitude>*, *<user's latitude>*
- radius: *50.0*
- timeslot: *Time.now*
- limit (=maximum number of jobs shown): *100*

### User authentication

Users can set up an account with their email address and a password or choose to log in using the OAuth2.0 services
provided by Google and GitHub.

The password is instantaneously encrypted using  [bcryt](https://en.wikipedia.org/wiki/Bcrypt) and stored in form of a
encrypted hash in the database. In case the user forgets this password, it can be reset via standard email
authentication.

To maximize the user's experience it is recommended to fill out the 'Preferences' field under 'My Profile'.
To log into the application, the user can use the mentioned OAuth2.0 services or use his password. In case that the
password is forgotten, the user can reset by giving his email address and follow the procedure specified in the email.

## How it works

Simply go to [our website](http://embloy.com/), create a new account or log in with an existing account. That's it.

## Config

### Prerequisites

- Install Ruby 2.7.5
- Install Rails 7
- Install Postgresql 15
- Open pgAdmin4
- Add a new server

### Connect to our remote database

-     hostname/address: <special authorization needed>
-     maintanence database: <special authorization needed>
-     username: <special authorization needed>
-     password: <special authorization needed>
-     port: 5432

### Start the server

**If you wish to experiment on our backend or contribute to our front end you can test your changes by starting a local
server.**

1. Create a file 'config/env_var.rb' with the following content:

   ```
   ENV['DATABASE_HOST'] = <special authorization needed>
   ENV['DATABASE_PASSWORD'] = <special authorization needed>
   ENV['DATABASE_URL'] = <special authorization needed>
   ENV['DATABASE_USER'] = <special authorization needed>
   ENV['GITHUB_KEY'] = <special authorization needed>
   ENV['GITHUB_SECRET'] = <special authorization needed>
   ENV['GOOGLE_OAUTH2_KEY'] = <special authorization needed>
   ENV['GOOGLE_OAUTH2_SECRET'] = <special authorization needed>
   ENV['RAILS_MASTER_KEY'] = <special authorization needed>
    ```

1. Run `$ rails db:create` to create all necessary tables in your development database.
2. Run `$ rails db:migrate` to migrate your changes to the database.
5. Run `$ rails server` to start the server.

### Go to http://localhost:3000

## Sources

*(TODO)*

## What's next

> ___Note: See GitHub issues for more information___

- Update profile section UI
- Update job UI
- Update application UI
- Update search UI
- ~~Update sign up UI~~
- Update Job & Application UI
- ~~Deploy test version~~
- Implement basic search function
- ~~Create seeds for jobs, users and applications~~
- ...

---
> Carlo Bortolan &nbsp;&middot;&nbsp;
> GitHub [@carlobortolan](https://github.com/carlobortolan) &nbsp;&middot;&nbsp;
> e-mail [@carlo.bortolan@tum.de](carlo.bortolan@tum.de)
>
> Jan Hummel &nbsp;&middot;&nbsp;
> GitHub [@github4touchdouble](https://github.com/github4touchdouble) &nbsp;&middot;&nbsp;
> e-mail [@jan.hummel@tum.de](jan.hummel@tum.de)