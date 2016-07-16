var mongoose = require('../../core/mongo.js');
var Schema   = require('mongoose').Schema;

const name = 'city';

var schema = new Schema({
    name    : String,
    idh_r   : Number,
    idh_l   : Number,
    idh_e   : Number,
    score   : Number
}, { collection: name } );

module.exports = mongoose.model(name, schema);