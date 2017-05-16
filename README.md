# Superpower Shop

![Alt text](./app/assets/images/entrance.png?raw=true "Entrance")

## Overview

* The goal of this project was to create a Rails platform that consumes the Giphy API and allows its users to “favorite” gifs.

* This project was completed as part of the curriculum at the [Turing School of Software & Design](http://turing.io).

### Setup

To set up a local copy of this project, perform the following:

  1. Clone the repository: `git clone https://github.com/bschwartz10/gif_generator`
  2. `cd` into the project's directory
  3. Run `bundle install`
  4. Run `bundle exec rake db:{create,migrate,seed}` to set up the postgres database and seed it with categories and gifs.
  - The seed includes the setup for an admin. To login as an admin, use these credentials - email: admin@example.com, password: password - or change these credentials in your seed file.
  5. Run the application in the dev environment by running `rails s`
  6. Visit `http://localhost:3000/login`

### Learning Goals

  * Use TDD to drive all layers of Rails development including unit and integration tests
  * Design a system of models which use one-to-one, one-to-many, and many-to-many relationships
  * Practice mixing HTML, CSS, and templates to create an inviting and usable User Interface
  * Differentiate responsibilities between components of the Rails stack
  * Build a logical user-flow that moves across multiple controllers and models

### Features (All links are localhost)

#### Admins
Admins of the site can [create a new gif](http://localhost:3000/admin/categories/new) by entering a category name. Admins can view all [existing categories](http://localhost:3000/categories) and also delete a category.

#### Users
A visitor can become a user by [creating an account](http://localhost:3000/users/new). A user can then [login](http://localhost:3000/login) and view all [existing categories](http://localhost:3000/categories). After clicking on a category a user can "favorite" any gif in that category. The "favorited" gif will then show up on the [user's profile page](http://localhost:3000/users/1).

### Design
I used [Bootstrap](http://getbootstrap.com/) to style this website.

### Test Suite

The test suite tests the application on multiple levels. To run all of the tests, run `rspec` from the terminal in the main directory of the project. The feature tests (integration tests) rely mainly on the [capybara gem](https://github.com/jnicklas/capybara) for navigating the various application views.

### Dependencies

This application depends on many ruby gems, all of which are found in the `Gemfile` and can be installed by running `bundle install` from the terminal in the main directory of the project.

### Project Links
[Gif Generator Github URL](https://github.com/bschwartz10/gif_generator)

[Gif Generator Project Spec](http://backend.turing.io/module2/projects/mini-project)

### Contributors:
* [Brett Schwartz](https://github.com/bschwartz10)
