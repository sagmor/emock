_ = require 'underscore'
nStore = require('nstore')
  .extend require('nstore/query')()

emails = nStore.new 'emails.db', (err) ->
  console.log 'Emails database loaded'

module.exports =
  all: (callback) ->
    emails.all (err, emails) ->
      response = _(emails).chain()
        .keys()
        .map (key) ->
          email = emails[key]
          email.id = key
          email
        .value()

      callback err, response

  get: (key, callback) ->
    emails.get key, (err, email, key) ->
      email.id = key
      callback err, email

  save: (message, callback) ->
    message.created_at = new Date
    emails.save null, message, (err, key) -> 
      callback? err, key

  clear: (callback) ->
    emails.clear? callback

  remove: (key, callback) ->
    emails.remove key, callback

