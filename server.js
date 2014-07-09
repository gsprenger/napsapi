// server.js
//*****************************************************************************
//* SETUP 
//*****************************************************************************
// requires
var express    = require('express');
var bodyParser = require('body-parser');
var mongoose   = require('mongoose');
var Nap        = require('./app/models/nap.js');

// vars
var mongoURI = process.env.MONGOLAB_URI || 'mongodb://localhost/napsapi';
var port = Number(process.env.PORT || 8080);

// create app
var app = express();
// enable getting POST data
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true
}));
// connect to MongoDB
mongoose.connect(mongoURI);

//*****************************************************************************
//* ROUTING
//*****************************************************************************
// Router
var apiRouter = express.Router();

// Naps CRUD routes
apiRouter.route('/naps')
  // POST /api/naps => Create one
  .post(function(req, res) {
    var n = new Nap();
    n.type        = req.body.type;
    n.description = req.body.description;
    n.coordinates = req.body.coordinates;

    n.save(function(err) {
      if (err) res.send(err);
      res.json({message: 'Nap created!'});
    });
  })
  // GET /api/naps => Read all
  .get(function(req, res) {
    Nap.find(function(err, naps) {
      if (err) res.send(err);
      res.json(naps);
    })
  });

apiRouter.route('/naps/:nap_id')
  // GET /api/naps/:nap_id => Read :nap_id
  .get(function(req, res) {
    Nap.findById(req.params.nap_id, function(err, n) {
      if (err) res.send(err);
      res.json(n);
    });
  })
  // PUT /api/naps/:nap_id => Update :nap_id
  .put(function(req, res) {
    Nap.findById(req.params.nap_id, function(err, n) {
      if (err) res.send(err);
      // Assign each property if present
      if (req.body.type)        n.type        = req.body.type;
      if (req.body.description) n.description = req.body.description;
      if (req.body.coordinates) n.coordinates = req.body.coordinates;
      n.save(function(err) {
        if (err) res.send(err);
        res.json({message: 'Nap updated!'});
      });
    });
  })
  // DELETE /api/naps/:nap_id => Delete :nap_id
  .delete(function(req, res) {
    Nap.remove({
      _id: req.params.nap_id
    }, function(err) {
      if (err) res.send(err);
      res.json({message: 'Nap deleted!'});
    });
  });


// Register apiRouter
app.use('/api', apiRouter);

//*****************************************************************************
//* SERVER 
//*****************************************************************************
app.listen(port, function() {
  console.log("Listening on port " + port);
});
