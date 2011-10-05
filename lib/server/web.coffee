restify = require 'restify'
store = require './stores/nstore'

server = restify.createServer()

server.get '/emails', (req,res) ->
  store.all (err, emails) -> 
    res.send 200, emails

server.get '/emails/:key', (req,res) ->
  store.get req.uriParams.key, (err,email) ->
    res.send 200, email

server.del '/emails/:key', (req,res) ->
  store.remove req.uriParams.key, (err, email) ->
    res.send 200, email

server.listen 8080
console.log "Web server running on port 8080"
