Backbone = require 'backbone'

class Router extends Backbone.Router
  routes:
    "": "index"
    "emails/:id": "show"

  index: ->
    console.log "index"

  show: (id) ->
    console.log "show", id

module.exports = Router
