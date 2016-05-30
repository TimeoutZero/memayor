var express     = require('express'),
    morgan      = require('morgan'),
    bodyParser  = require('body-parser');
    
var mongoose = require('./config/mongo.js');

const PORT = process.env.MEMAYOR_PORT || 7000;

var app = express();

app.use(morgan('combined'));
app.use(express.static('public'));
app.use(bodyParser.json());

app.use('/city'     , require('./features/city/route.js'));
app.use('/proposal' , require('./features/proposal/route.js'));

app.listen(PORT, () => {
    console.log(`MeMayor started... PORT=${PORT}`);
});