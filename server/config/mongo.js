'use strict';

//IMPORTS
var mongoose = require('mongoose');
var Schema   = mongoose.Schema;

//CONSTANTS
const MONGO_HOST = process.env.MONGO_HOST || 'localhost';
var url = `mongodb://${MONGO_HOST}/memayor`;

console.log(`[MONGO] URL: [${url}]`);
mongoose.connect(url);

var db = mongoose.connection;

db.once('open', () => {
   console.log('[MONGO] Connection has been established');
});

db.on('error', console.error.bind(console, 'connection error:'));

module.exports = mongoose;

