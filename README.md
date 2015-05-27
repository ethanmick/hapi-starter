Hapi Starter
============

A template for creating a Node.js application using Hapi in CoffeeScript.

* [Hapi](https://github.com/hapijs/hapi)
* [Hapi Documentation](http://hapijs.com/api)
* [Coffee Script](http://coffeescript.org/)

Installation
============

1. clone: `$ git clone git@github.com:Wayfarer247/hapi-starter.git`
2. cd: `$ hapi-starter`
3. install: `$ npm install`
4. run: `$ make`
5. Update the `package.json` file with the correct information for the new project. Also update the git repo: `git remote set-url origin git@github.com:user/project.git`

# Changelog #

## Version 1.1.0 - May 27th, 2015 ##
* Moved server to it's own class
* Created a new init script that starts the server
* coffee_bridge points to new init script
* Changed tests to just be integration tests with Hapi's inject method
* Simplified code
* Added code coverage
* Added linting

## Version 1.0.0 - December 30th, 2014 ##
* First Version
