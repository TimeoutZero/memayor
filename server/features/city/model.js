var moongose = require('../../config/mongo.js');
var Schema   = moongose.Schema;

var schema = new Schema({
    name    : String,
    idh_r   : Number,
    idh_l   : Number,
    idh_e   : Number,
    score   : Number
},{ collection: 'City' });

var City = moongose.model('City', schema);
module.exports = City;