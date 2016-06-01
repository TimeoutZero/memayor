var moongose = require('../../config/mongo.js');
var Schema   = moongose.Schema;

const name = 'Proposal';

var schema = new Schema({
    title       : { type : String , required : true },
    description : { type : String , required : true },
    categories  : { type : Array  , required : true },
    cityId      : { type : String , required : true },
    votes       : Number,
    created_at  : Date,
    updated_at  : Date
}, { collection : name });

schema.pre('save', function (next) {
    
    this.updated_at = new Date();
    this.votes      = 0;
    
    if (!this.created_at) {
        this.created_at = this.updated_at;
    }
    
    next();
})

module.exports = moongose.model(name, schema);