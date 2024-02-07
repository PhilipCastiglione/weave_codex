# README

This is the Weave Codex CMS, or at least the first version of it.

This exists for me to create and manage data for the Weave Codex, and publish it to make it available for the static website front end project.

## Architecture

This is a Ruby on Rails application. I use a local webserver to access the CMS. The server is not deployed, instead the sqlite db and published output are checked in to version control.

* SQLite database

## Getting Started

db commands - given we check in the sqlite db
running tests
...

## CMS Usage

```sh
bin/rails s
```
...

## TODO

- [ ] create a single data model
  - [ ] model it
  - [ ] migration
  - [ ] code
  - [ ] tests
  - [ ] seed with data
- [ ] create a simple publishing workflow
  - [ ] publish the data
  - [ ] publish the schema
- [ ] pick a cms gem
- [ ] linting
- [ ] formatting
