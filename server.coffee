smtp = require 'smtp'

smtp.createServer (connection) ->
    connection.on 'DATA', (message) ->
      msg =
        sender: message.sender
        recipients: message.recipients
        data: ""

      message.on 'data', (data) ->
        msg.data = msg.data + data

      message.on 'end', ->
        message.accept()
        console.log msg
  .listen 2525

console.log "SMTP server running on port 2525"
