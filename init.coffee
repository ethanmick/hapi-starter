'use strict'
#
# Author Name
# 2015
#

Server = require './lib/server'
log = winston = require 'winston'

winston.remove(winston.transports.Console);
winston.add(winston.transports.Console, {
  level: process.env.WINSTON or 'debug'
  colorize: yes
  json: no
  timestamp: yes
  prettyPrint: yes
})

config =
  http:
    port: process.env.PORT
    host: process.env.HOST

s = new Server(config.http)
s.setup().then ->
  s.start()
.fail (err)->
  log.error '************* ERROR STARTING SERVER *************'
  log.error err
  log.error '************* ERROR STARTING SERVER *************'
  log.error 'What most likely happened?'
  log.error 'The Server FAILED to get the correct configuration values for Startup!'
  log.error '  Did you use the Makefile? This is what it\'s there for.'
  log.error '  Did you start the process with the correct ENV Variables?'
.done()



