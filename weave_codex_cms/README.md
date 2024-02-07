# README

This is the Weave Codex CMS, or at least the first version of it.

This exists for me to create and manage data for the Weave Codex, and publish it to make it available for the static website front end project.

## Architecture

This is a Ruby on Rails application. I use a local webserver to access the CMS. The server is not deployed, instead the sqlite db and published output are checked in to version control.

* SQLite database

## Getting Started

Install dependencies:

```sh
bundle
brew install vips
```

Since we only have one environment (development/local) and have checked the sqlite db, it is already set up. 

If you want to confirm things are working as expected, you can run:

```sh
bin/rails db:migrate
bin/rails db:setup
```

Running tests:

```sh
bin/rails test
```

...

## CMS Usage

```sh
bin/rails s
```
...

## TODO

- [x] create a single data model
  - [x] model it
  - [x] migration
  - [x] code
  - [x] tests
  - [x] seed with data
- [ ] create a simple publishing workflow
  - [ ] publish the data
  - [ ] publish the schema
- [ ] pick a cms gem
- [ ] linting
- [ ] formatting
