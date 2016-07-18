var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('200 OK');
});

app.get('/status', function (req, res) {
  res.send('IT VERY VERY GOOD');
});

var server = app.listen(process.env.PORT || 3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});