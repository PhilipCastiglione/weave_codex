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
  - [x] publish the data
  - [ ] publish type data
- [ ] pick a cms gem
- [ ] linting
- [ ] formatting
- [ ] tests
- [ ] enhance the publishing workflow to indicate what is dirty
- [ ] publish versions & backups

### Modelling

MapRegion - should map something to an area on the map, at a given layer - probably drawn svgs? could be multiple
MapLayer - 3d topography; eg mountains, surface, caves, the underworld, ...

Groups - eg Lunaria, Palladia, Freedom, the Dhow, ...
Subgroup (maybe this is just groups self join) - Palladian factions, clans, Lunarian tribes, ...
Species
Individual People
City

Flora
Fauna

Biome

Plane? eg. Tapestry vs Weft

Displayed, undisplayed 

Military stuff
