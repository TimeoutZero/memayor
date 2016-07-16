var mongoose = require('mongoose');
var Schema   = mongoose.Schema;

const name = 'proposal';

var schema = new Schema({
    title       : { type : String , required : true },
    description : { type : String , required : true },
    categories  : { type : Array  , required : true },
    cityId      : { type : String , required : true },
    votes       : { type : Number , default : 0 },
    created_at  : { type : Date   , default : Date.now()},
    updated_at  : Date
}, { collection : 'proposal' });

// schema.pre('save', function (next) {
    
//     this.updated_at = new Date();
//     this.votes      = 0;
    
//     if (!this.created_at) {
//         this.created_at = this.updated_at;
//     }
    
//     next();
// })

module.exports = mongoose.model(name, schema);