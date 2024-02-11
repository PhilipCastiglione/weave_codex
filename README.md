# Weave Codex

## Introduction

Weave Codex is a project that helps me with world building for Weave, a fantasy world I am creating and using as a setting for writing novels.

In addition to helping with the process of world building, the codex displays the information in an interactive way.

## Architecture

Weave Codex has two components.

1. A CMS run locally to enter and manage the data. I'll start by using Ruby on Rails and running a webserver locally, because I know there are a bunch of libraries that will get me up and running fast. Later, I could perhaps write a native app.
2. A static website that displays the data. Since the data only changes when I edit it, I can skip running a server entirely and just use some easy edge hosting option. I'll figure out which framework to use for this later.

The two components should agree on the data being structured according to some obvious conventions.

## Data Structure

* Structured (typed) text data, with a schema.
* Media files (referenced by pointers in the text data)

Read/write from the CMS, read from the static website front end.

## CMS

Rapid prototype using Ruby on Rails, using whatever libs get me there fastest.

The CMS should ideally have a very basic publication pipeline so that I can make partial content changes without them being visible until I'm ready.

## Static Site

...

## TODO

- [x] create the data folder structure
- [x] rails new the cms
- [x] pick something for the front end and initialise it
- [ ] meta/config project files, root level entrypoint
