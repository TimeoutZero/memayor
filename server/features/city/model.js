var moongose = require('../../config/mongo.js');
var Schema   = moongose.Schema;

const name = 'City';

var schema = new Schema({
    name    : String,
    idh_r   : Number,
    idh_l   : Number,
    idh_e   : Number,
    score   : Number
}, { collection: name } );

module.exports = moongose.model(name, schema);