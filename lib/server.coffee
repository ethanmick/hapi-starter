'use strict'
#
# CloudMine, Inc
# 2015
#
Hapi = require 'hapi'
Q = require 'q'
log = require 'winston'

class Server

  constructor: (opts)->
    @server = new Hapi.Server({
      connections:
        routes:
          payload:
            timeout: no
          cors:
            origin: ['*']
          timeout:
            server: no
            socket: no
    })
    @server.connection(opts)

    ###
    # This just gives you some nice logging, understanding what the response
    # was for the request.
    ###
    @server.ext 'onPreResponse', (req, reply)->
      response = req.response
      log.debug 'response', response.statusCode
      reply.continue()

  setup: (opts)->
    register = Q.nbind(@server.register, @server)
    register({
      register: require('hapi-router-coffee')
      options:
        routesDir: "#{__dirname}/routes/"
    })

  start: ->
    Q.nbind(@server.start, @server)().then =>
      log.debug 'Server started at: ', @server.info.uri
      log.debug 'Ready to go!'

  stop: ->
    Q.nbind(@server.stop, @server)()

module.exports = Server
