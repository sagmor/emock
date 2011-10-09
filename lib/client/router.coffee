Backbone = require 'backbone'
Emails = require 'emails'
Email = require 'email'

class Router extends Backbone.Router
  routes:
    "": "index"
    "emails/:id": "show"

  index: ->
    emails = new Emails
    emails.fetch
      success: console.log emails

  show: (id) ->
    email = new Email
      id: id
    email.fetch
      success: console.log email

module.exports = Router
