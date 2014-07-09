// app/models/nap.js

var mongoose = require('mongoose');
var Schema   = mongoose.Schema;

var NapSchema   = new Schema({
  type:        String,
  description: String,
  coordinates: String
});

module.exports = mongoose.model('Nap', NapSchema);
