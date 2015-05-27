'use strict'
#
# Author Name
# 2015
#

# You can use any assertion library you want!
should = require('chai').should()
Server = require '../../lib/server'

describe 'Server', ->

  s = null
  before (done)->
    s = new Server()
    s.setup({}).then ->
      done()

  it 'should "start"', (done)->
    s.start().then ->
      done()

  it 'should stop', (done)->
    s.stop().then ->
      done()

  it 'should 404', (done)->
    req =
      method: 'POST'
      url: '/path/to/nowhere'

    s.server.inject req, (res)->
      res.statusCode.should.equal 404
      res.result.error.should.equal 'Not Found'
      done()

  it 'should return 200 ok', (done)->
    req =
      method: 'GET'
      url: '/status'

    s.server.inject req, (res)->
      res.statusCode.should.equal 200
      res.result.status.should.equal 'ok'
      done()
