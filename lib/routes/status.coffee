'use strict'
#
# Author Name
# 2015
#

###
* This is just an example Route
* The server will automatically scan this directory and load all files,
* and load all routes from each file. It expects the `exports` to either
* be an Array of Objects (like below), or, an Object with each value being
* an object with the route configuration.
###
module.exports = [
  method: 'GET'
  path: '/status'
  handler: (req, reply)->
    reply(status: 'ok')
]
