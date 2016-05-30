'use strict';

var Q        = require('Q'),
    City     = require('./model.js');

class CityDAO {
    
    findAll (params = {}) {
       return Q.promise((resolve, reject) => {
           City.find(params, (err, cities) => {
               if (err) {
                   reject(err);
               } else {
                   resolve(cities);
               }
           });
       });
    }
}

module.exports = new CityDAO;