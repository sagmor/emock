nStore = require('nstore')
  .extend require('nstore/query')()

emails = nStore.new 'emails.db', (err) ->
  console.log 'Emails database loaded'

module.exports =
  all: (callback) ->
    emails.all (err, emails) ->
      callback err, emails

  get: (key, callback) ->
    emails.get key, (err, email, key) ->
      callback err, email

  save: (message, callback) ->
    emails.save null, message, (err, key) -> 
      callback? err, key

  clear: (callback) ->
    emails.clear? callback

  remove: (key, callback) ->
    emails.remove key, callback

