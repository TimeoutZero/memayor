'use strict';

var Q  = require('Q'),
  City = require('./model.js');

class CityDAO {
  
  findById(id) {
    return Q.promise((resolve, reject) => {
      City.findById(id, (err, city) => {
        if (err) {
          reject(err);
        } else {
          resolve(city);
        }
      });
    });
  }

  findAll(params = {}) {
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

  search(name) {
    return Q.promise((resolve, reject) => {

      let regexp = new RegExp(name, 'i');

      City.find({ name : regexp }, (err, cities) => {
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