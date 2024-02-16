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

- [ ] make rich text admininistrate fields work
  * support is coming shortly: https://github.com/thoughtbot/administrate/pull/2411
- [ ] pluralisation for fauna because faunas is killing me
- [ ] linting
- [ ] formatting
- [ ] tests
- [ ] enhance the publishing workflow to indicate what is dirty
- [ ] publish versions & backups
- [ ] string enums (...when I need one)
- [ ] image fields/attachments

### Modelling

#### Entities

* ~~Flora~~
* ~~Fauna~~
* Groups - eg Lunaria, Palladia, Freedom, the Dhow, ...
* Subgroup (maybe this is just groups self join)
  * Palladian factions, clans, Lunarian tribes, ...
* Species
* Individual People
* City
* Biome
* Military stuff

#### Layers, Filters

* MapLayer - 3d topography; eg mountains, surface, caves, the underworld, ..., people/flora/fauna/climate
* Plane? eg. Tapestry vs Weft
* Displayed, undisplayed
* Time

#### Connections

* MapRegion - should map something to an area on the map, at a given layer - probably drawn svgs? could be multiple
