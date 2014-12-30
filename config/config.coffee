'use strict'

dev =
  port: 3456
  host: '0.0.0.0'

production =
  port: 3456
  host: '0.0.0.0'

config = dev

if process.env.NODE_ENV
  switch process.env.NODE_ENV
    when 'production'
      config = production

module.exports = config
