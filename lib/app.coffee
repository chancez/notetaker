module.exports = () ->
  express = require('express')
  basePath = __dirname.substr(0, __dirname.length-4)

  app = express()
  app.use require('connect-assets')()
  app.set 'view engine', 'jade'
  app.set 'views', basePath + '/templates/'

  require('./handlers')(app)

  app.listen(3000)
