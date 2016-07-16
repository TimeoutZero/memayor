'use strict';

// #######################################
// NPM MODULES
// #######################################

let mongoose = require('mongoose'),
  nconf = require('nconf');

// #######################################
// LOCAL MODULES
// #######################################

let LOGGER = require('./logger.js');

// #######################################
// INIT
// #######################################

const MONGO_URL = `mongodb://${nconf.get('mongo:host')}/memayor`;
const MONGO_OPTIONS = nconf.get('mongo:options');

LOGGER.info(`URL: ${MONGO_URL}, OPTIONS: ${MONGO_OPTIONS} `);

mongoose.connect(MONGO_URL, MONGO_OPTIONS);
let connect = mongoose.connection;

connect.on('connected', () => {
  LOGGER.debug('MongoDB connected!');
});

connect.on('error', (error) => {
  LOGGER.error(error);
});

connect.on('close', () => {
  LOGGER.debug('MongoDB closed!');
});

connect.on('reconnected', () => {
  LOGGER.debug('MongoDB reconnected!');
});

connect.on('disconnected', () => {
  LOGGER.debug('MongoDB disconnected!');
});

module.exports = connect;