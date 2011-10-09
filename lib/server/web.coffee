restify = require 'restify'
static = require 'node-static'
stitch  = require 'stitch'

store = require './stores/nstore'

server = restify.createServer()

server.get '/emails', (req,res) ->
  store.all (err, emails) -> 
    res.send 200, emails

server.get '/emails/:key', (req,res) ->
  store.get req.uriParams.key, (err,email) ->
    if email
      res.send 200, email
    else
      res.send 404, null

server.del '/emails/:key', (req,res) ->
  store.remove req.uriParams.key, (err, email) ->
    res.send 200, email

# Client app server
package = stitch.createPackage
  paths: [__dirname + '/../client']
server.get '/application.js', package.createServer()

# Static files
file = new static.Server('./public')
server.get /\/(index\.html|images\/.*)?/, (req,res) -> file.serve req,res

server.listen 8080
console.log "Web server running on port 8080"
