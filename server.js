// server.js

/***** SETUP *****/
// requires
var express  = require('express');
var mongoose = require('mongoose');
var Nap      = require('./app/models/nap.js');

// vars
var mongoURI = process.env.MONGOLAB_URI || 'mongodb://localhost/napsapi';
var port = Number(process.env.PORT || 8080);

// create & setup app
var app = express();
mongoose.connect(mongoURI);

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
app.listen(port, function() {
  console.log("Listening on port " + port);
});
