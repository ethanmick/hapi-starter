'use strict'

Hapi = require 'hapi'
Q = require 'q'
config = require './config/config'

server = new Hapi.Server(
  debug: { request: ['error'] }
)
server.connection port: config.port, address: config.host

server.on 'internalError', (request, err)->
  console.log err

##################################################################
#                             Start                              #
##################################################################

start = ->
  console.log 'Attempting to start Hapi server.'
  deferred = Q.defer()
  server.start ->
    console.log 'Server started at: ', server.info.uri
    deferred.resolve()
  deferred.promise

start()
