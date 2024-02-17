# README

This is the Weave Codex CMS, or at least the first version of it.

This exists for me to create and manage data for the Weave Codex, and publish it to make it available for the static website front end project.

## Architecture

This is a Ruby on Rails application. I use a local webserver to access the CMS. The server is not deployed, instead the sqlite db and published output are checked in to version control.

* SQLite database
* Administrate gem with minor customisation to generate CRUD views from configuration

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

...

## CMS Usage

```sh
bin/rails s
```

Visit http://127.0.0.1:3000/admin

## TODO

### Features

- [ ] make rich text admininistrate fields work
  * support is coming shortly: https://github.com/thoughtbot/administrate/pull/2411
- [ ] enhance the publishing workflow to indicate what is dirty
- [ ] publish versions & backups
- [ ] string enums (...when I need one)
- [ ] image fields/attachments

### Hygiene

- [ ] pluralisation (inflections) because faunas is killing me
- [ ] linting
- [ ] formatting
- [ ] tests

### Modelling

#### Entities

- [x] Flora
- [x] Fauna
- [x] Species
- [x] Domain
- [x] Domain / Species ref
- [ ] DomainGroup
  * name
  * type (religion, political, ...)
  * description
  * membership
  * domain ref
  * self join?
  * Palladian factions, clans, Lunarian tribes, ...
- [ ] Domain / DomainGroup ref
- [ ] Individuals
  * name
- [ ] City
  * name
- [ ] Biome
  * name
- [ ] Military stuff?

#### Layers, Filters

- [ ] Plane? eg. Tapestry vs Weft
- [ ] MapLayer - 3d topography; eg mountains, surface, caves, the underworld, ..., people/flora/fauna/climate
- [ ] Displayed, undisplayed
- [ ] Time (n key points, not a slider)
- [ ] Military

#### Connections

- [ ] MapRegion - should map something to an area on the map, at a given layer - probably drawn svgs? could be multiple
