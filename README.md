# default_sinatra

A skeleton of a default classic Sinatra application

Prominent items in use:

- Bootstrap framework in the sample content
- Sinatra Contrib
- Active Support and Active Record (Postgres)
- RSpec, Capybara, Factory Bot, Faker
- Rubocop

Check out the rake tasks: `bundle exec rake -T`

## Setup

### Create environment variables

vi .env.development.local

```sh
export APP_ENV=development
export APPLICATION_NAME=default_sinatra
export DATABASE_HOST=localhost
```

### Load environment variables

```sh
source .env.development.local
```

### Database

There is an option to run postgres in Docker, or use another database server.

#### Start

```sh
docker-compose up -d db
```

#### Create & Migrate

```sh
bundle exec rake db:create
bundle exec rake db:migrate
```

### Application

#### Run

Run it locally or build and run it as a docker container.

```sh
bundle exec rackup
```

```sh
docker-compose build
docker-compose up -d app
```

## Developing

Definitions and recommendations oh how to develop using this Sinatra skeleton.

### Database

Settings located in `config/database.yml`

#### Create a migration

```sh
bundle exec rake db:new_migration name=<name of migration>
```

### Models

Add models to `app/models` and organize how you prefer.

### Routing

Add routes to `app/routes` and organize how you prefer.

### Views

Add html/erb files to `app/views` and organize how you prefer.

Recommendation: organize models, routing and views in a similar manner.

### Helpers

A few helpers to advance the application.

#### stylesheet_controller

Adds extra stylesheets to that page, if defined

In layout head section: `<%= stylesheet_controller %>`
In route: `stylesheet :'views/main.css'`
In public path: `/stylesheets/views/main.css`

#### javascript_controller

Adds extra javascript to that page, if defined

In layout just before body close: `<%= javascript_controller %>`
In route: `javascript :'views/main.css'`
In public path: `/javascripts/views/main.css`

## License and Copyright

Copyright 2012-2019, Nick Willever

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```