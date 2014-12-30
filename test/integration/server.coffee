should = require('chai').should()
supertest = require('supertest')
config = require '../../config/config'
api = supertest("#{config.host}:#{config.port}")

describe 'Server', ->

  it 'should 404', (done)->
    api.post('/path/to/nowhere')
      .set('content-type', 'application/json')
      .set('accept', 'application/json')
      .expect(404)
      .end (err, res)->
        res.body.error.should.equal 'Not Found'
        done()
