'use strict';

var Q = require('Q'),
    proposal = require('./model.js');

class ProposalDAO {

    findById(id) {
        return Q.promise((resolve, reject) => {
            proposal.findById(id, (err, proposal) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(proposal);
                }
            });
        });
    }

    findAllByCityId(cityId) {
        return Q.promise((resolve, reject) => {
            proposal.find({ cityId : cityId }, (err, proposals) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(proposals);
                }
            });
        });
    }

    save(params) {
        return Q.promise((resolve, reject) => {

            var newProposal = proposal(params);

            newProposal.save((err) => {
                if (err) {
                    reject(err);
                } else {
                    resolve();
                }
            });
        });
    }

    update(id, params) {
        return Q.promise((resolve, reject) => {

        });
    }

    remove(id) {
        return Q.promise((resolve, reject) => {
            proposal.findByIdAndRemove(id, (err) => {
                if (err) {
                    reject(err);
                } else {
                    resolve();
                }
            })
        });
    }
}

module.exports = new ProposalDAO();
