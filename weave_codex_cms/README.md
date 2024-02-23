# README

This is the Weave Codex CMS, or at least the first version of it.

This exists for me to create and manage data for the Weave Codex, and publish it to make it available for the static website front end project.

## Architecture

This is a Ruby on Rails application. I run a local webserver to access the CMS. The server is not deployed (because then I don't have to host anything).

Instead the sqlite db and published output are checked in to version control.

* SQLite database
* Administrate gem with minor customisation to generate CRUD views from configuration
* Custom publishing pipeline

## Getting Started

Install dependencies:

```sh
bundle
brew install vips
```

Since we only have one environment (development/local) and have checked in the sqlite db, it is already set up. 

If you want to confirm things are working as expected, you can run:

```sh
bin/rails db:migrate
bin/rails db:setup
```

Running tests:

```sh
bin/rails test
```

Linting:

```sh
rubocop -a
```

Formatting:

Configure VS Code to use RuboCop autoformatting, by following instructions
[here](https://docs.rubocop.org/rubocop/usage/lsp.html).

## CMS Usage

```sh
bin/rails s
```

Visit http://127.0.0.1:3000

## TODO

### Features

- [ ] make rich text admininistrate fields work
  * support is coming shortly: https://github.com/thoughtbot/administrate/pull/2411
  - [ ] ...maybe it's not that shortly, I can just add text fields and write html while waiting
- [ ] publishing
  - [ ] enhance the workflow to indicate what is dirty/what will be published
  - [ ] versions & backups
- [ ] string enums (...when I need one)
- [ ] image fields/attachments

### Hygiene, Fixes

- [ ] declarations should reflection optionality
- [ ] tests

### Modelling

#### Entities

- [ ] Character extensions
  - [ ] what rich text fields?
  - [ ] quotes
  - [ ] relationships - join table plus either text or enum
- [ ] Military stuff?

#### Layers, Filters

- [ ] Plane? eg. Tapestry vs Weft
- [ ] MapLayer - 3d topography; eg mountains, surface, caves, the underworld, ..., people/flora/fauna/climate
- [ ] Displayed, undisplayed
- [ ] Time (n key points, not a slider)
- [ ] Military
