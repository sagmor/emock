var smtp = require('smtp');

smtp.createServer(function(connection) {
  connection.on('DATA', function(message) {
    var msg ={
      sender: message.sender,
      recipients: message.recipients,
      data: ""
    };

    message.on('data', function(data) {
         msg.data = msg.data + data;
    });

    message.on('end', function() {
      message.accept();
      console.log(msg);
    });
  });
}).listen(2525);

console.log("SMTP server running on port 2525");
