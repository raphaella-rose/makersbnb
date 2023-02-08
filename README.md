# makersbnb

A web application that allows users to list spaces they have available, and to hire spaces for the night.

This was a group project that took place 4 weeks into a Maker's Bootcamp program and took place over 4 days. It was the first experience of working as in team for a coding project. The project utilized several Ruby-based tools and frameworks including Sinatra, Sinatra-contrib, Sinatra-flash, Rspec, Capybara, Bcrypt, Simplecov, PG, and Puma to build a functional web application.

## User Stories

```
As a [EXAMPLE USER STORY]

```

https://github.com/makersacademy/course/blob/main/pills/development_workflow.md

Hello from Raphaella :)

hello from paddy

## hello from eman

how to branch and push to main:

```

1. Git pull
2. Check new branch: git checkout -b name_of_branch
3. Work as normal
4. When you git push you must specify: git push --set-upstream origin name_of_branch

Then move to the github website and create a pull request (you should get a prompt at the top of your screen).

```

=======

# MAKERSBNB infrastructure set up

└── MAKERSBNB
├── spec
│ ├── features
│ │ ├── xxxx_xxxxx_spec.rb
│ │ ├── view_properties_spec.rb
│ │ └── xxx_xxxx.rb
│ └── spec_helper.rb
├── .rspec
├── Gemfile
├── Gemfile.lock
├── app.rb
└── config.ru

# Setup

Install Ruby and `bundle install` inside the main directory.

## Database configuration

Make sure PostgreSQL is installed using apt get or sudo and then run using:
`brew services start postgresql`

### Users Database

Steps to create database and table for production and test environments.

1. `createdb makersbnb`;
2. `createdb makersbnb_test`;

3. Then start PostgreSQL using psql <name of database>
4. For each database run all commands found in: ./db/migrations/
