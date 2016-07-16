'use strict';

// #######################################
// NPM MODULES
// #######################################

let express     = require('express'),
    morgan      = require('morgan'),
    nconf       = require('nconf'),
    bodyParser  = require('body-parser');

// #######################################
// LOCAL MODULES
// #######################################

const LOGGER = require('./core/logger.js'); 

// #######################################
// INIT
// #######################################

const PORT = process.env.MEMAYOR_PORT || 9000;

let app = express();
nconf.file(process.env.PROPERTIES);

app.use(morgan('combined'));
app.use(express.static('public'));
app.use(bodyParser.json());

app.use('/city' , require('./features/city/route.js'));
app.use('/city' , require('./features/proposal/route.js'));

app.listen(PORT, () => {
    LOGGER.info(`[APPLICATION] Started... PORT=${PORT}`);
});

module.exports = app;