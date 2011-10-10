Backbone = require 'backbone'
Emails = require 'emails'
Email = require 'email'
EmailsView = require 'emails_view'
EmailView = require 'email_view'

class Router extends Backbone.Router
  routes:
    "": "index"
    "emails/:id": "show"

  index: ->
    emails = new Emails
    emails.fetch()

    view = new EmailsView
      collection: emails

    $('#content').html view.render().el

  show: (id) ->
    email = new Email
      id: id
    email.fetch()

    view = new EmailView
      model: email

    $('#content').html view.render().el

module.exports = Router
