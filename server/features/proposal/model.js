var moongose = require('../../config/mongo.js');
var Schema   = moongose.Schema;

var schema = new Schema({
    title       : { type : String , required : true },
    description : { type : String , required : true },
    categories  : { type : Array  , required : true },
    city        : { type : String , required : true },
    votes       : Number,
    created_at  : Date,
    updated_at  : Date
});

schema.pre('save', function (next) {
    
    this.updated_at = new Date();
    
    if (!this.created_at) {
        this.created_at = this.updated_at;
    }
    
    next();
})

var Proposal = moongose.model('Proposal', schema);

module.exports = Proposal;