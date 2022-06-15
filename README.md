# makersbnb
A web application that allows users to list spaces they have available, and to hire spaces for the night.

## User Stories

```
As a [EXAMPLE USER STORY]

```

https://github.com/makersacademy/course/blob/main/pills/development_workflow.md

Hello from Raphaella :) 

hello from paddy




----------
how to branch and push to main:
```

1. Git pull
2. Check new branch: git checkout -b name_of_branch
3. Work as normal 
4. When you git push you must specify: git push --set-upstream origin name_of_branch

Then move to the github website and create a pull request (you should get a prompt at the top of your screen).

```
=======
hello from eman

# MAKERSBNB infrastructure set up

└── MAKERSBNB
    ├── spec
    │   ├── features
    │   │   ├── xxxx_xxxxx_spec.rb
    │   │   ├── view_properties_spec.rb
    │   │   └── xxx_xxxx.rb
    │   └── spec_helper.rb
    ├── .rspec
    ├── Gemfile
    ├── Gemfile.lock
    ├── app.rb
    └── config.ru

# Database configuration
## Users Database

Steps to create database and table for production and test environments.

1. CREATE DATABASE makersbnb; 
2. CREATE DATABASE makersbnb_test;
3. Please refer to this file: ./db/migrations/01_create_table.sql and execute after
steps 1 and 2 respectively. 
