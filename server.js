// server.js

var express = require('express');
var app = express();

/***** ROUTING *****/
// Router
var router = express.Router();

// Test route
router.get('/', function(req, res) {
  res.json({message: 'Hello World!'});
});

// Register router
app.use('/api', router);

/***** SERVER *****/
var port = Number(process.env.PORT || 8080);
app.listen(port, function() {
  console.log("Listening on port " + port);
});
